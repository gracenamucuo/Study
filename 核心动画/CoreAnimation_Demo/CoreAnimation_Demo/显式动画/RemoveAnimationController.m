//
//  RemoveAnimationController.m
//  CoreAnimation_Demo
//
//  Created by 戴运鹏 on 2018/4/29.
//  Copyright © 2018年 戴运鹏. All rights reserved.
//

#import "RemoveAnimationController.h"
//弧度转角度
#define RADIANS_TO_DEGREES(x) ((x)/M_PI*180.0)//传入弧度 eg: M_PI_4
//角度转弧度
#define DEGREES_TO_RADIANS(x) ((x)/180.0*M_PI)//传入度数eg:45度
@interface RemoveAnimationController ()<CAAnimationDelegate>
@property (nonatomic,strong)CALayer *shipLayer;
@property (nonatomic,strong)UIBezierPath *path;
@property (nonatomic,assign)CGPoint position;
@end

@implementation RemoveAnimationController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.position = CGPointMake(0, 150);
    [self pathAnimation];
}

///CGPath动画
- (void)pathAnimation
{
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:CGPointMake(0, 150)];
    [path addCurveToPoint:CGPointMake(300, 150) controlPoint1:CGPointMake(75, 0) controlPoint2:CGPointMake(225, 300)];
    self.path = path;
    CAShapeLayer *pathLayer = [CAShapeLayer layer];
    pathLayer.path = self.path.CGPath;
    pathLayer.fillColor = [UIColor clearColor].CGColor;
    pathLayer.strokeColor = [UIColor redColor].CGColor;
    pathLayer.lineWidth = 3.f;
    [self.view.layer addSublayer:pathLayer];
    
    CALayer *shipLayer = [CALayer layer];
    shipLayer.frame = CGRectMake(0, 0, 65, 64);
    
    shipLayer.position = self.position;
    shipLayer.contents = (__bridge id)[UIImage imageNamed:@"ship"].CGImage;
    shipLayer.affineTransform = CGAffineTransformMakeRotation(DEGREES_TO_RADIANS(90));
    [self.view.layer addSublayer:shipLayer];
    self.shipLayer = shipLayer;
    

}

- (IBAction)start:(UIButton *)sender {

    
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animation];
    animation.keyPath = @"position";
    animation.duration = 4;
    animation.path = self.path.CGPath;
    animation.rotationMode = kCAAnimationRotateAuto;
      animation.delegate = self;
    [self.shipLayer addAnimation:animation forKey:@"rotateAnimation"];
  
}

- (IBAction)stop:(UIButton *)sender {
    [self.shipLayer removeAnimationForKey:@"rotateAnimation"];
      self.shipLayer.position = self.position;
}
#pragma mark --CAAnimationDelegate

- (void)animationDidStart:(CAAnimation *)anim
{
    
}

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag
{
    NSLog(@"-----%d",flag);
    NSLog(@"%@---%@",NSStringFromCGRect(self.shipLayer.frame),NSStringFromCGPoint(self.shipLayer.position));
   self.position =  CGPointMake(self.shipLayer.frame.origin.x + self.shipLayer.frame.size.width / 2, self.shipLayer.frame.origin.y + self.shipLayer.frame.size.height / 2);
  
}
@end
