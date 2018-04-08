//
//  TabTransitionRootController.m
//  CustomTransition_Demo
//
//  Created by 戴运鹏 on 2018/4/6.
//  Copyright © 2018年 戴运鹏. All rights reserved.
//

#import "TabTransitionRootController.h"
#import "TabTransitionFirstController.h"
#import "TabTransitionSecondController.h"
#import "TabTransitionThirdController.h"
#import "UIViewController+LoadController.h"
@interface TabTransitionRootController ()

@end

@implementation TabTransitionRootController

- (void)viewDidLoad {
    [super viewDidLoad];
    UITabBarController *tab = [[UITabBarController alloc]init];
    TabTransitionFirstController *first = [TabTransitionFirstController loadFromMainStoryboard];
    TabTransitionSecondController *second = [TabTransitionSecondController loadFromMainStoryboard];
    TabTransitionThirdController *third = [TabTransitionThirdController loadFromMainStoryboard];
    [tab setViewControllers:@[first,second,third]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
