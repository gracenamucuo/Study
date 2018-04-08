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
@interface NavgationTransitionFromController ()<UINavigationControllerDelegate>

@end

@implementation NavgationTransitionFromController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
- (IBAction)puahAction:(UIButton *)sender {
    NavgationTransitionToController *toVC = [NavgationTransitionToController loadFromMainStoryboard];
    toVC.transitioningDelegate = self;
    [self.navigationController pushViewController:toVC animated:YES];
}

//- (void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated;
//- (void)navigationController:(UINavigationController *)navigationController didShowViewController:(UIViewController *)viewController animated:(BOOL)animated;
//
//- (UIInterfaceOrientationMask)navigationControllerSupportedInterfaceOrientations:(UINavigationController *)navigationController NS_AVAILABLE_IOS(7_0) __TVOS_PROHIBITED;
//- (UIInterfaceOrientation)navigationControllerPreferredInterfaceOrientationForPresentation:(UINavigationController *)navigationController NS_AVAILABLE_IOS(7_0) __TVOS_PROHIBITED;
//
//- (nullable id <UIViewControllerInteractiveTransitioning>)navigationController:(UINavigationController *)navigationController
//                                   interactionControllerForAnimationController:(id <UIViewControllerAnimatedTransitioning>) animationController NS_AVAILABLE_IOS(7_0);
//
//- (nullable id <UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController
//                                            animationControllerForOperation:(UINavigationControllerOperation)operation
//                                                         fromViewController:(UIViewController *)fromVC
//                                                           toViewController:(UIViewController *)toVC  NS_AVAILABLE_IOS(7_0);
//
//

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
