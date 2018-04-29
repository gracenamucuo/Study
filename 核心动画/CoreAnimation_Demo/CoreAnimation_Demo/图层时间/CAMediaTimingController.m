//
//  CAMediaTimingController.m
//  CoreAnimation_Demo
//
//  Created by 戴运鹏 on 2018/4/29.
//  Copyright © 2018年 戴运鹏. All rights reserved.
//

#import "CAMediaTimingController.h"
//弧度转角度
#define RADIANS_TO_DEGREES(x) ((x)/M_PI*180.0)//传入弧度 eg: M_PI_4
//角度转弧度
#define DEGREES_TO_RADIANS(x) ((x)/180.0*M_PI)//传入度数eg:45度
@interface CAMediaTimingController ()
@property (weak, nonatomic) IBOutlet UISlider *speedSlider;
@property (weak, nonatomic) IBOutlet UISlider *timeSlider;
@property (weak, nonatomic) IBOutlet UILabel *speedLabel;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (nonatomic,strong)UIBezierPath *path;
@property (nonatomic,strong)CALayer *shipLayer;
@end

@implementation CAMediaTimingController

- (void)viewDidLoad {
    [super viewDidLoad];
//    [self doorAnimatation];
    [self controlAnimation];
    
}
- (IBAction)play:(UIButton *)sender {
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animation];
    animation.keyPath = @"position";
    animation.timeOffset = self.timeSlider.value;
    animation.duration = 1;
    animation.path = self.path.CGPath;
    animation.speed = self.speedSlider.value;
    animation.rotationMode = kCAAnimationRotateAuto;
    animation.removedOnCompletion = NO;
    animation.fillMode = kCAFillModeForwards;
    [self.shipLayer addAnimation:animation forKey:@"slide"];
}

- (void)controlAnimation
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
    
    shipLayer.position = CGPointMake(0, 150);
    shipLayer.contents = (__bridge id)[UIImage imageNamed:@"ship"].CGImage;
    shipLayer.affineTransform = CGAffineTransformMakeRotation(DEGREES_TO_RADIANS(90));
    [self.view.layer addSublayer:shipLayer];
    self.shipLayer = shipLayer;
    
    self.timeLabel.text = [NSString stringWithFormat:@"%.2f",self.timeSlider.value];
    self.speedLabel.text = [NSString stringWithFormat:@"%.2f",self.speedSlider.value];
    
}
- (IBAction)speedAction:(UISlider *)sender {
    float speed = sender.value;
    self.speedLabel.text = [NSString stringWithFormat:@"%.2f",speed];
}
- (IBAction)timeAction:(UISlider *)sender {
    CFTimeInterval timeOffset = sender.value;
    self.timeLabel.text = [NSString stringWithFormat:@"%.2f",timeOffset];
}

- (void)doorAnimatation
{
    CALayer *doorLayer = [CALayer layer];
    doorLayer.frame = CGRectMake(0, 0, 150, 300);
    doorLayer.position = self.view.center;
    doorLayer.anchorPoint = CGPointMake(0, 0.5);
    doorLayer.contents = (__bridge id)[UIImage imageNamed:@"door"].CGImage;
    [self.view.layer addSublayer:doorLayer];
    
    CATransform3D perspective = CATransform3DIdentity;
    perspective.m34 = -1 / 500;
    self.view.layer.sublayerTransform = perspective;
    
    CABasicAnimation *animation = [CABasicAnimation animation];;
    animation.keyPath = @"transform.rotation.y";
    animation.toValue = @(-M_PI_4);
    animation.duration = 1;
    animation.repeatDuration = INFINITY;
    animation.autoreverses = YES;
    [doorLayer addAnimation:animation forKey:nil];
    
}

@end






















