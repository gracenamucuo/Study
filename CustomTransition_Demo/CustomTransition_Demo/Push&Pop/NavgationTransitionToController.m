//
//  NavgationTransitionToController.m
//  CustomTransition_Demo
//
//  Created by 戴运鹏 on 2018/4/6.
//  Copyright © 2018年 戴运鹏. All rights reserved.
//

#import "NavgationTransitionToController.h"

@interface NavgationTransitionToController ()

@end

@implementation NavgationTransitionToController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (IBAction)popAction:(UIButton *)sender {
    [self.navigationController popViewControllerAnimated:YES];
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
