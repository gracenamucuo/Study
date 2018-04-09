//
//  NavgationTransitionFromController.m
//  CustomTransition_Demo
//
//  Created by 戴运鹏 on 2018/4/6.
//  Copyright © 2018年 戴运鹏. All rights reserved.
//

#import "NavgationTransitionFromController.h"
#import "NavgationTransitionToController.h"
#import "UIViewController+LoadController.h"
#import "ModelTrasitionAnimator.h"
@interface NavgationTransitionFromController ()<UINavigationControllerDelegate>

@end

@implementation NavgationTransitionFromController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
- (IBAction)puahAction:(UIButton *)sender {
    NavgationTransitionToController *toVC = [NavgationTransitionToController loadFromMainStoryboard];
    self.navigationController.delegate = self;
    [self.navigationController pushViewController:toVC animated:YES];
}


//- (nullable id <UIViewControllerInteractiveTransitioning>)navigationController:(UINavigationController *)navigationController
//                                   interactionControllerForAnimationController:(id <UIViewControllerAnimatedTransitioning>) animationController
//{
//
//}

- (nullable id <UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController
                                            animationControllerForOperation:(UINavigationControllerOperation)operation
                                                         fromViewController:(UIViewController *)fromVC
                                                           toViewController:(UIViewController *)toVC
{
    return operation == UINavigationControllerOperationPush ? [ModelTrasitionAnimator modelTransitionAnimatorWithTransitionType:DYPModelTransitionTypePresent] : [ModelTrasitionAnimator modelTransitionAnimatorWithTransitionType:DYPModelTransitionTypeDismiss];
}

@end
