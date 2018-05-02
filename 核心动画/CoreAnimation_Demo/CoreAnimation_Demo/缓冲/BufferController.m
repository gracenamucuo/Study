//
//  BufferController.m
//  CoreAnimation_Demo
//
//  Created by 戴运鹏 on 2018/4/30.
//  Copyright © 2018年 戴运鹏. All rights reserved.
//

#import "BufferController.h"

@interface BufferController ()<CAAnimationDelegate>
@property (nonatomic,strong)CALayer *colorLayer;
@property (nonatomic,strong)UIView *colorView;
@property (nonatomic,strong)UIImageView *ballImageView;
@end

float interpolate(float from,float to,float time)
{
    return (to -  from) * time + from;
}
float bounceEaseOut(float t)
{
    if (t < 4/11.0) {
        return (121 * t * t)/16.0;
    } else if (t < 8/11.0) {
        return (363/40.0 * t * t) - (99/10.0 * t) + 17/5.0;
    } else if (t < 9/10.0) {
        return (4356/361.0 * t * t) - (35442/1805.0 * t) + 16061/1805.0;
    }
    return (54/5.0 * t * t) - (513/25.0 * t) + 268/25.0;
}

@implementation BufferController

- (void)viewDidLoad {
    [super viewDidLoad];
//    [self bufferFunction];
//    [self bufferAndKeyFrameAnimation];
//    [self createFunctionByBezierPath];
    [self creatBallFallAnimation];
}
///想要实现一个篮球落地的慢慢反弹的动画效果，用贝塞尔曲线实现不了，需要用关键帧动画，把每一帧做成一个计时函数
//==============================================================================
- (void)creatBallFallAnimation
{
    CALayer *containerLayer = [CALayer layer];
    containerLayer.frame = CGRectMake(0, 0, 350, 450);
    containerLayer.position = self.view.center;
    [self.view.layer addSublayer:containerLayer];
    containerLayer.backgroundColor = [UIColor lightGrayColor].CGColor;
    
    UIImage *ball = [UIImage imageNamed:@"ball"];
    UIImageView *imageView = [[UIImageView alloc]initWithImage:ball];
    self.ballImageView = imageView;
    [self.view addSubview:imageView];
    
}

- (void)ballAnimate
{
    self.ballImageView.center = CGPointMake(150, 32);
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animation];
    animation.keyPath = @"position";
    animation.duration = 1;
    animation.delegate = self;
    animation.values = @[[NSValue valueWithCGPoint:CGPointMake(150, 32)],[NSValue valueWithCGPoint:CGPointMake(150, 268)],[NSValue valueWithCGPoint:CGPointMake(150, 140)],[NSValue valueWithCGPoint:CGPointMake(150, 268)],[NSValue valueWithCGPoint:CGPointMake(150, 220)],[NSValue valueWithCGPoint:CGPointMake(150, 268)],[NSValue valueWithCGPoint:CGPointMake(150, 250)],[NSValue valueWithCGPoint:CGPointMake(150, 268)]];
    animation.timingFunctions = @[[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn],[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut],[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn],[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut],[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn],[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut],[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn]];
    animation.keyTimes = @[@0.0,@0.3,@0.5,@0.7,@0.8,@0.9,@0.95,@1.0];
    self.ballImageView.layer.position = CGPointMake(150, 268);
    [self.ballImageView.layer addAnimation:animation forKey:nil];
    
}
///球动画优化
-(void)optimizeBallAnimation
{
    self.ballImageView.center = CGPointMake(150, 32);
    
    NSValue *fromValue = [NSValue valueWithCGPoint:CGPointMake(150, 32)];
    NSValue *toValue = [NSValue valueWithCGPoint:CGPointMake(150, 268)];
    CFTimeInterval dutation = 2;
    NSInteger numFrames = dutation * 60;
    NSMutableArray *frames = [NSMutableArray array];
    for (int i = 0; i < numFrames; i++) {
        float time = 1 / (float)numFrames * i;
        time = bounceEaseOut(time);
        [frames addObject:[self interpolateFromValue:fromValue toValue:toValue time:time]];
    }
    
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animation];
    animation.keyPath = @"position";
    animation.duration = 1;
    animation.delegate = self;
    animation.values = frames;
    self.ballImageView.layer.position = CGPointMake(150, 268);

    [self.ballImageView.layer addAnimation:animation forKey:nil];
}

- (id)interpolateFromValue:(id)fromValue toValue:(id)toValue time:(float)time
{
    if ([fromValue isKindOfClass:[NSValue class]]) {
        const char *type = [fromValue objCType];
        if (strcmp(type, @encode(CGPoint)) == 0) {
            CGPoint from = [fromValue CGPointValue];
            CGPoint to = [toValue CGPointValue];
            CGPoint result = CGPointMake(interpolate(from.x, to.x, time), interpolate(from.y, to.y, time));
            return [NSValue valueWithCGPoint:result];
        }
    }
    return (time < 0.5) ? fromValue : toValue;
}

//时钟缓冲函数
-(void)timeFunction
{
    //+ (instancetype)functionWithControlPoints:(float)c1x :(float)c1y :(float)c2x :(float)c2y;

  CAMediaTimingFunction *function =  [CAMediaTimingFunction functionWithControlPoints:1 :0 :0.75 :1];
}
//==============================================================================
///缓冲函数用图形表示
- (void)createFunctionByBezierPath
{
    CALayer *containerLayer = [CALayer layer];
    containerLayer.frame = CGRectMake(0, 0, 250, 250);
    containerLayer.position = self.view.center;
    [self.view.layer addSublayer:containerLayer];
    containerLayer.backgroundColor = [UIColor lightGrayColor].CGColor;
    
    
    CAMediaTimingFunction *function = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
//    CAMediaTimingFunction *function =  [CAMediaTimingFunction functionWithControlPoints:1 :0 :0.75 :1];

    //获得缓冲函数的控制点。三次贝塞尔曲线，起点和终点都是固定的{0，0}和{1，1}。控制点不一样。
//    CGPoint controlPoint1 = CGPointZero; CGPoint controlPoint2 = CGPointZero;
    float a[2];
    float b[2];
    [function getControlPointAtIndex:1 values:a];
    [function getControlPointAtIndex:2 values:b];
    
    UIBezierPath *path = [[UIBezierPath alloc]init];
    [path moveToPoint:CGPointZero];
    [path addCurveToPoint:CGPointMake(1, 1) controlPoint1:CGPointMake(a[0], a[1]) controlPoint2:CGPointMake(b[0], b[1])];
    [path applyTransform:CGAffineTransformMakeScale(200, 200)];
    
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    shapeLayer.strokeColor = [UIColor redColor].CGColor;
    shapeLayer.fillColor = [UIColor clearColor].CGColor;
    shapeLayer.lineWidth = 1;
    shapeLayer.path = path.CGPath;
    [containerLayer addSublayer:shapeLayer];
    containerLayer.geometryFlipped = YES;
    
}

//=====================================================================================
///缓冲和关键帧动画
- (void)bufferAndKeyFrameAnimation
{
    self.colorLayer = [CALayer layer];
    self.colorLayer.frame = CGRectMake(0, 0, 100, 100);
    self.colorLayer.position = self.view.center;
    self.colorLayer.backgroundColor = [UIColor redColor].CGColor;
    [self.view.layer addSublayer:self.colorLayer];
}

- (void)changeColor
{
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animation];
    animation.keyPath = @"backgroundColor";
    animation.duration = 0.5;
    animation.repeatCount = INFINITY;
    animation.values = @[(__bridge id)[UIColor redColor].CGColor,(__bridge id)[UIColor greenColor].CGColor,(__bridge id)[UIColor blueColor].CGColor,(__bridge id)[UIColor redColor].CGColor];
    CAMediaTimingFunction *fn = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    animation.timingFunctions = @[fn,fn,fn];
    [self.colorLayer addAnimation:animation forKey:nil];
    
}

//================================================================================
///缓冲函数
- (void)bufferFunction
{
    self.colorLayer = [CALayer layer];
    self.colorLayer.frame = CGRectMake(0, 0, 100, 100);
    self.colorLayer.position = self.view.center;
    self.colorLayer.backgroundColor = [UIColor redColor].CGColor;
    [self.view.layer addSublayer:self.colorLayer];
    
    self.colorView = [[UIView alloc]init];
    self.colorView.frame = CGRectMake(0, 0, 100, 100);
    self.colorView.center = self.view.center;
    self.colorView.backgroundColor = [UIColor greenColor];
    [self.view addSubview:self.colorView];
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [super touchesBegan:touches withEvent:event];
//    [CATransaction begin];
//    [CATransaction setAnimationDuration:2];
//    [CATransaction setAnimationTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut]];
//    self.colorLayer.position = [[touches anyObject] locationInView:self.view];
//    [CATransaction commit];
//
//
//    [UIView animateWithDuration:2 delay:0 options:UIViewAnimationOptionCurveEaseIn animations:^{
//        self.colorView.center = [[touches anyObject] locationInView:self.view];
//    } completion:^(BOOL finished) {
//
//    }];
    
    //关键帧动画
//    [self changeColor];
    
    ///篮球落地
//    [self ballAnimate];
    [self optimizeBallAnimation];
}



@end








