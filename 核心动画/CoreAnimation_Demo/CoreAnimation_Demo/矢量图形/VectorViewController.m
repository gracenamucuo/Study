//
//  VectorViewController.m
//  CoreAnimation_Demo
//
//  Created by 戴运鹏 on 2018/5/7.
//  Copyright © 2018年 戴运鹏. All rights reserved.
//

#import "VectorViewController.h"
#import "DrawingView.h"
@interface VectorViewController ()

@end

@implementation VectorViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    DrawingView *view = [[DrawingView alloc]init];
    view.frame = self.view.bounds;
    [self.view addSubview:view];
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
