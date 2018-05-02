//
//  ManualOperationController.m
//  CoreAnimation_Demo
//
//  Created by 戴运鹏 on 2018/4/30.
//  Copyright © 2018年 戴运鹏. All rights reserved.
//

#import "ManualOperationController.h"

@interface ManualOperationController ()
@property (nonatomic,strong)CALayer *doorLayer;
@end

@implementation ManualOperationController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self doorAnimatation];
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
    self.doorLayer = doorLayer;
    
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc]init];
    [pan addTarget:self action:@selector(pan:)];
    [self.view addGestureRecognizer:pan];
    doorLayer.speed = 0;
    
    
    
}

- (void)pan:(UIPanGestureRecognizer *)gr
{
  
    
    
    CGFloat x = [gr translationInView:self.view].x;
    
    
    
    CFTimeInterval timeOffset = self.doorLayer.timeOffset;

     NSLog(@"%f---%f",x,timeOffset);
    x /= 200;

    timeOffset = MIN(0.999, MAX(0, timeOffset - x));//获得一个过程中的相对值，直接将动画切换到对应的点，看起来相当于能手动控制动画。
    self.doorLayer.timeOffset = timeOffset;
    [gr setTranslation:CGPointZero inView:self.view];
}

@end


















































