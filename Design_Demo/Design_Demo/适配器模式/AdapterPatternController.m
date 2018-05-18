//
//  AdapterPatternController.m
//  Design_Demo
//
//  Created by 戴运鹏 on 2018/5/18.
//  Copyright © 2018年 戴运鹏. All rights reserved.
//

#import "AdapterPatternController.h"
#import "FlyModel.h"
#import "ClassAdapter.h"
#import "ObjectAdapter.h"
#import "AdapterTestView.h"
#import "UIView+loadFromNib.h"
@interface AdapterPatternController ()

@end

@implementation AdapterPatternController

- (void)viewDidLoad {
    [super viewDidLoad];
    //对象适配器
    FlyModel *fly = [[FlyModel alloc]init];
    fly.flyImage = @"ship";
    fly.flyInfo = @"这是对象适配器的飞机信息";
    ObjectAdapter *objAdapter = [[ObjectAdapter alloc]initWithAdaptee:fly];
    AdapterTestView *test1 = [AdapterTestView loadFromNib];
    [test1 renderViewWithDataModel:objAdapter];
    test1.frame = CGRectMake(0, 64, 200, 200);
    test1.backgroundColor= [UIColor redColor];
    [self.view addSubview:test1];
    
    //类适配器
    ClassAdapter *classAdapter = [[ClassAdapter alloc]init];
    AdapterTestView *test2 = [AdapterTestView loadFromNib];
    [test2 renderViewWithDataModel:classAdapter];
    test2.frame = CGRectMake(0, 350, 200,  200);
    test2.backgroundColor = [UIColor redColor];
    [self.view addSubview:test2];
}

@end




















