//
//  PresentingController.m
//  CustomTransition_Demo
//
//  Created by 戴运鹏 on 2018/4/8.
//  Copyright © 2018年 戴运鹏. All rights reserved.
//

#import "PresentingController.h"
#import "UIViewController+LoadController.h"
#import "ModelTrasitionAnimator.h"
#import "PresentedController.h"
#import "DYPInteractiveTransition.h"
@interface PresentingController ()<UIViewControllerTransitioningDelegate>
@property (nonatomic,strong)DYPInteractiveTransition *presentInteration;
@property (nonatomic,strong)DYPInteractiveTransition *dismissInteration;
@end

@implementation PresentingController

- (void)viewDidLoad {
    [super viewDidLoad];
//    NSLog(@"%@的%@",self,self.view);
   self.presentInteration = [DYPInteractiveTransition interactionControllerWithTransitionType:DYPInteractiveTransitionType_Present gestureDirection:DYPInteractiveTransitionGestureDirection_up];
    [self.presentInteration addGestureOnViewController:self];
    __weak typeof(self) weakSelf = self;
    self.presentInteration.presentBlock = ^{
        [weakSelf presentAction:nil];
    };
    
}

- (IBAction)dismissAction:(UIButton *)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}


//如果转场不需要交互的话，实现这两个代理方法分别返回presented和dismissed的动画控制器就可以了。
- (nullable id <UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source
{
    return [ModelTrasitionAnimator modelTransitionAnimatorWithTransitionType:DYPModelTransitionTypePresent];
}

- (nullable id <UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed
{
    return [ModelTrasitionAnimator modelTransitionAnimatorWithTransitionType:DYPModelTransitionTypeDismiss];
}


- (nullable id <UIViewControllerInteractiveTransitioning>)interactionControllerForPresentation:(id <UIViewControllerAnimatedTransitioning>)animator
{
    return self.presentInteration.interation ?self.presentInteration : nil;
}

- (nullable id <UIViewControllerInteractiveTransitioning>)interactionControllerForDismissal:(id <UIViewControllerAnimatedTransitioning>)animator
{
    return self.dismissInteration;
}

- (IBAction)presentAction:(UIButton *)sender {
    PresentedController *presentedVC = [PresentedController loadFromMainStoryboard];
    presentedVC.transitioningDelegate = self;
        self.dismissInteration = [DYPInteractiveTransition interactionControllerWithTransitionType:DYPInteractiveTransitionType_Dismiss gestureDirection:DYPInteractiveTransitionGestureDirection_down];
    [self.dismissInteration addGestureOnViewController:presentedVC];
    [self presentViewController:presentedVC animated:YES completion:nil];
}


@end
