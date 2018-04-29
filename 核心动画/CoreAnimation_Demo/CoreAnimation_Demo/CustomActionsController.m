//
//  CustomActions.m
//  CoreAnimation_Demo
//
//  Created by 戴运鹏 on 2018/4/29.
//  Copyright © 2018年 戴运鹏. All rights reserved.
//

#import "CustomActionsController.h"

@interface CustomActionsController ()
@property (nonatomic,strong)CALayer *containerLayer;
@property (nonatomic,strong)UIView *contaierView;

@end

@implementation CustomActionsController

- (void)viewDidLoad {
    [super viewDidLoad];
//    [self implicitAnimation];
//    [self customActions];
    [self presentationLayer];
}

///呈现图层
- (void)presentationLayer
{
    self.containerLayer = [CALayer layer];
    self.containerLayer.frame = CGRectMake(0, 0, 100, 100);
    self.containerLayer.position = self.view.center;
    self.containerLayer.backgroundColor = [UIColor redColor].CGColor;
    [self.view.layer addSublayer:self.containerLayer];
}

///自定义行为
- (void)customActions
{
    self.contaierView = [[UIView alloc]initWithFrame:CGRectMake(0, 20, 200, 200)];
    self.contaierView.backgroundColor = [UIColor redColor];
    self.contaierView.center = self.view.center;
    [self.view addSubview:self.contaierView];
    
    self.containerLayer = [CALayer layer];
    self.containerLayer.frame = CGRectMake(0, 0, 120, 120);
    self.containerLayer.backgroundColor = [UIColor redColor].CGColor;
    self.containerLayer.position = CGPointMake(self.contaierView.frame.size.width / 2, self.contaierView.frame.size.height  / 2);
    [self.contaierView.layer addSublayer:self.containerLayer];
    
    CATransition *transition = [CATransition animation];
    transition.type = kCATransitionPush;
    transition.subtype = kCATransitionFromLeft;
    self.containerLayer.actions = @{@"backgroundColor":transition};
    
}

///隐式动画
- (void)implicitAnimation
{
    self.containerLayer = [CALayer layer];
    self.containerLayer.frame = CGRectMake(0, 0, 150, 150);
    self.containerLayer.backgroundColor = [UIColor redColor].CGColor;
    self.containerLayer.position = self.view.center;
    [self.view.layer addSublayer:self.containerLayer];
    
    
    self.contaierView = [[UIView alloc]initWithFrame:CGRectMake(0, 20, 100, 100)];
    self.contaierView.backgroundColor = [UIColor redColor];
    [self.view addSubview:self.contaierView];
    if ([self.contaierView conformsToProtocol:NSProtocolFromString(@"CALayerDelegate")]) {
        NSLog(@"------");
    }
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [super touchesBegan:touches withEvent:event];
//    //新的事务
//    [CATransaction begin];
//    [CATransaction setAnimationDuration:3];
//    [CATransaction setCompletionBlock:^{
//        CGAffineTransform transform = self.containerLayer.affineTransform;
//        transform = CGAffineTransformRotate(transform, M_PI_4);
//        self.containerLayer.affineTransform = transform;
//    }];
    CGFloat red = arc4random() / (CGFloat)INT_MAX;
    CGFloat green = arc4random() / (CGFloat)INT_MAX;
    CGFloat blue = arc4random() / (CGFloat)INT_MAX;
//    self.containerLayer.backgroundColor = [UIColor colorWithRed:red green:green blue:blue alpha:1].CGColor;
//    //提交事务
//    [CATransaction commit];
//
//    [UIView animateWithDuration:3 animations:^{
//        self.contaierView.layer.backgroundColor = [UIColor colorWithRed:red green:green blue:blue alpha:1].CGColor;
//    }];
    //    [UIView beginAnimations:@"colorChange" context:nil];
    //    [UIView setAnimationDuration:3];
    //    self.contaierView.backgroundColor = [UIColor colorWithRed:red green:green blue:blue alpha:1];
    //    [UIView commitAnimations];
    
    ///自定义行为
//      self.containerLayer.backgroundColor = [UIColor colorWithRed:red green:green blue:blue alpha:1].CGColor;

    ///呈现图层
    CGPoint point = [[touches anyObject]locationInView:self.view];
    if ([self.containerLayer.presentationLayer hitTest:point]) {
        self.containerLayer.backgroundColor = [UIColor colorWithRed:red green:green blue:blue alpha:1].CGColor;
    }else{
        [CATransaction begin];
        [CATransaction setAnimationDuration:4];
        self.containerLayer.position = point;
        [CATransaction commit];
    }
    
}
@end
