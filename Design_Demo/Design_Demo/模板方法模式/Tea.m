//
//  Tea.m
//  Design_Demo
//
//  Created by 戴运鹏 on 2018/6/8.
//  Copyright © 2018年 戴运鹏. All rights reserved.
//

#import "Tea.h"

@implementation Tea

- (void)brew
{
    NSLog(@"加入茶叶冲泡");
}

- (void)addCondiments
{
    NSLog(@"加入柠檬🍋");
}

- (BOOL)addHook
{
    NSLog(@"我不想加柠檬");//可以对外声明接口，让客户去选择是否
    return NO;
}

@end
