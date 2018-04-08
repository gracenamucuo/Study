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
@interface PresentingController ()<UIViewControllerTransitioningDelegate>

@end

@implementation PresentingController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (nullable id <UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source
{
    return [ModelTrasitionAnimator modelTransitionAnimatorWithTransitionType:DYPModelTransitionTypePresent];
}

- (nullable id <UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed
{
    return [ModelTrasitionAnimator modelTransitionAnimatorWithTransitionType:DYPModelTransitionTypeDismiss];
}

- (IBAction)presentAction:(UIButton *)sender {
    PresentedController *presentedVC = [PresentedController loadFromMainStoryboard];
    presentedVC.transitioningDelegate = self;
    [self presentViewController:presentedVC animated:YES completion:nil];
}


@end
