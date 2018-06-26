//
//  ViewController.m
//  ETLayout_Demo
//
//  Created by 戴运鹏 on 2018/6/26.
//  Copyright © 2018年 戴运鹏. All rights reserved.
//

#import "ViewController.h"
#import "ETLayoutHeader.h"
@interface ViewController ()
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIView *red = [[UIView alloc]init];
    red.backgroundColor = [UIColor redColor];
    [self.view addSubview:red];
    [red et_makeConstraint:^(ETLayoutMaker *make) {
        make.top(self.view.et_top, 20).left(self.view.et_left, 100).width(100).height(100);
    }];
    
    UILabel *label = [[UILabel alloc]init];
    label.text = @"scrollView";
    label.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:label];
    [label et_makeConstraint:^(ETLayoutMaker *make) {
        make.top(red.et_bottom, 5).centerX(red.et_centerX, 0);
    }];
    
    UIScrollView *scrollView = [[UIScrollView alloc]init];
    [self.view addSubview:scrollView];
    scrollView.backgroundColor = [UIColor lightGrayColor];
    [scrollView et_makeConstraint:^(ETLayoutMaker *make) {
        make.top(label.et_bottom, 10).left(self.view.et_left, 10).right(self.view.et_right, -10);
        make.height(self.view.frame.size.height / 2);
    }];
    

    UIView *containerView = [[UIView alloc]init];
    containerView.backgroundColor = [UIColor greenColor];
    [scrollView addSubview:containerView];
    [containerView et_makeConstraint:^(ETLayoutMaker *make) {
        make.edges(scrollView, UIEdgeInsetsMake(0, 0, 0, 0));
        make.width(self.view.frame.size.width - 20);
        make.height(1000);
    }];

    
}

@end






