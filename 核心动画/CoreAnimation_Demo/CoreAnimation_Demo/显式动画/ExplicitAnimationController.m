//
//  ExplicitAnimationController.m
//  CoreAnimation_Demo
//
//  Created by 戴运鹏 on 2018/4/29.
//  Copyright © 2018年 戴运鹏. All rights reserved.
//

#import "ExplicitAnimationController.h"
//弧度转角度
#define RADIANS_TO_DEGREES(x) ((x)/M_PI*180.0)//传入弧度 eg: M_PI_4
//角度转弧度
#define DEGREES_TO_RADIANS(x) ((x)/180.0*M_PI)//传入度数eg:45度
@interface ExplicitAnimationController ()<CAAnimationDelegate>
@property (nonatomic,strong)CALayer *colorLayer;
@end

@implementation ExplicitAnimationController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    [self propertyAnimation];
//    [self pathAnimation];
//    [self virtualAnimation];
        [self groupAnimation];
}

///属性动画
- (void)propertyAnimation
{
    self.colorLayer = [CALayer layer];
    self.colorLayer.frame = CGRectMake(50, 150, 100, 100);
    self.colorLayer.backgroundColor = [UIColor blueColor].CGColor;
     [self.view.layer addSublayer:self.colorLayer];
}

- (void)changeColor
{
    CGFloat red = arc4random() / (CGFloat)INT_MAX;
    CGFloat green = arc4random() / (CGFloat)INT_MAX;
    CGFloat blue = arc4random() / (CGFloat)INT_MAX;
    UIColor *color = [UIColor colorWithRed:red green:green blue:blue alpha:1];
    
    CABasicAnimation *animation = [CABasicAnimation animation];
    animation.keyPath = @"backgroundColor";
    animation.toValue = (__bridge id)color.CGColor;
    animation.delegate = self;
    [self.colorLayer addAnimation:animation forKey:nil];
}

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag
{
    [CATransaction begin];
    [CATransaction setDisableActions:YES];
    self.colorLayer.backgroundColor = (__bridge CGColorRef _Nullable)(((CABasicAnimation*)anim).toValue);
    [CATransaction commit];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [super touchesBegan:touches withEvent:event];
    //    [self changeColor];
    //    [self keyFrameAnimation];
}

///关键帧动画
- (void)keyFrameAnimation
{
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animation];;
    animation.keyPath = @"backgroundColor";
    animation.duration = 2;
    animation.values = @[(__bridge id)[UIColor blueColor].CGColor,(__bridge id)[UIColor redColor].CGColor,(__bridge id)[UIColor greenColor].CGColor,(__bridge id)[UIColor blueColor].CGColor];
    [self.colorLayer addAnimation:animation forKey:nil];
}

///CGPath动画
- (void)pathAnimation
{
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:CGPointMake(0, 150)];
    [path addCurveToPoint:CGPointMake(300, 150) controlPoint1:CGPointMake(75, 0) controlPoint2:CGPointMake(225, 300)];
    
    CAShapeLayer *pathLayer = [CAShapeLayer layer];
    pathLayer.path = path.CGPath;
    pathLayer.fillColor = [UIColor clearColor].CGColor;
    pathLayer.strokeColor = [UIColor redColor].CGColor;
    pathLayer.lineWidth = 3.f;
    [self.view.layer addSublayer:pathLayer];
    
    CALayer *shipLayer = [CALayer layer];
    shipLayer.frame = CGRectMake(0, 0, 65, 64);
    shipLayer.position = CGPointMake(0, 150);
    shipLayer.contents = (__bridge id)[UIImage imageNamed:@"ship"].CGImage;
    shipLayer.affineTransform = CGAffineTransformMakeRotation(DEGREES_TO_RADIANS(90));
    [self.view.layer addSublayer:shipLayer];
    
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animation];
    animation.keyPath = @"position";
    animation.duration = 4;
    animation.path = path.CGPath;
    animation.rotationMode = kCAAnimationRotateAuto;
    [shipLayer addAnimation:animation forKey:nil];
    
}

///虚拟属性动画
- (void)virtualAnimation
{
    CALayer *shipLayer  = [CALayer layer];
    shipLayer.frame = CGRectMake(0, 0, 128, 128);
    shipLayer.position = CGPointMake(150, 150);
    shipLayer.contents = (__bridge id)[UIImage imageNamed:@"ship"].CGImage;
    [self.view.layer addSublayer:shipLayer];
    
    CABasicAnimation *animation = [CABasicAnimation animation];
    animation.keyPath = @"transform.rotation";
    animation.duration = 2;
    animation.byValue = @(M_PI * 2);
    [shipLayer addAnimation:animation forKey:nil];
}

///动画组
- (void)groupAnimation
{
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:CGPointMake(0, 150)];
    [path addCurveToPoint:CGPointMake(300, 150) controlPoint1:CGPointMake(75, 0) controlPoint2:CGPointMake(225, 300)];
    
    CAShapeLayer *pathLayer = [CAShapeLayer layer];
    pathLayer.path = path.CGPath;
    pathLayer.fillColor = [UIColor clearColor].CGColor;
    pathLayer.strokeColor = [UIColor redColor].CGColor;
    pathLayer.lineWidth = 3.f;
    [self.view.layer addSublayer:pathLayer];
    
    CALayer *shipLayer = [CALayer layer];
    shipLayer.frame = CGRectMake(0, 0, 65, 64);
    shipLayer.position = CGPointMake(0, 150);
    shipLayer.backgroundColor = [UIColor greenColor].CGColor;
//    shipLayer.contents = (__bridge id)[UIImage imageNamed:@"ship"].CGImage;
//    shipLayer.affineTransform = CGAffineTransformMakeRotation(DEGREES_TO_RADIANS(90));
    [self.view.layer addSublayer:shipLayer];
    
    //位置动画
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animation];
    animation.keyPath = @"position";
    animation.duration = 4;
    animation.path = path.CGPath;
    animation.rotationMode = kCAAnimationRotateAuto;
    [shipLayer addAnimation:animation forKey:nil];

    //颜色动画
    CABasicAnimation *colorAnimation = [CABasicAnimation animation];
    colorAnimation.keyPath = @"backgroundColor";
    colorAnimation.toValue = (__bridge id _Nullable)([UIColor redColor].CGColor);
    
    //动画组
    CAAnimationGroup *group = [CAAnimationGroup animation];
    group.animations = @[animation,colorAnimation];
    group.duration = 4;
    [shipLayer addAnimation:group forKey:nil];
}


@end


