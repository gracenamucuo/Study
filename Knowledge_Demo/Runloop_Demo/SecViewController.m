//
//  SecViewController.m
//  Runloop_Demo
//
//  Created by 戴运鹏 on 2019/3/6.
//  Copyright © 2019 戴运鹏. All rights reserved.
//

#import "SecViewController.h"
#import "CustomView.h"
#import "UIViewController+loadFromStoryBoard.h"
@interface SecViewController ()

@end

@implementation SecViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [super touchesBegan:touches withEvent:event];
    CustomView *custom = [[CustomView alloc]initWithFrame:CGRectMake(100, 100, 100, 100)];
    custom.backgroundColor = [UIColor redColor];
    [self.view addSubview:custom];
    
}

- (void)viewWillLayoutSubviews
{
    [super viewWillLayoutSubviews];
    NSLog(@"%@:%@",[self class],NSStringFromSelector(_cmd));
}

- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
   NSLog(@"%@:%@",[self class],NSStringFromSelector(_cmd));
}

- (void)updateViewConstraints
{
  NSLog(@"%@:%@",[self class],NSStringFromSelector(_cmd));
    [super updateViewConstraints];
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
