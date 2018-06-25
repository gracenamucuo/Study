//
//  ViewController.m
//  Layout_Demo
//
//  Created by 戴运鹏 on 2018/6/24.
//  Copyright © 2018年 戴运鹏. All rights reserved.
//

#import "ViewController.h"
#import "Masonry.h"
#import "RedViewLayout.h"
#import "UIView+Layout.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIView *redView = [[UIView alloc]init];
    redView.backgroundColor = [UIColor redColor];
    [self.view addSubview:redView];
    RedViewLayout *redLayout = [[RedViewLayout alloc]init];
    redLayout.superView = self.view;
    NSDictionary *dic1 = @{@"view":self.view,@"direction":@(NSLayoutAttributeTop),@"offset":@(100)};
     NSDictionary *dic2 = @{@"view":self.view,@"direction":@(NSLayoutAttributeLeft),@"offset":@(100)};
    redLayout.layoutAttris = @[dic1,dic2];
    [redView makeLayout:redLayout];
}




@end








