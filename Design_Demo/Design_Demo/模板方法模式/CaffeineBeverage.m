//
//  CaffeineBeverage.m
//  Design_Demo
//
//  Created by 戴运鹏 on 2018/6/8.
//  Copyright © 2018年 戴运鹏. All rights reserved.
//

#import "CaffeineBeverage.h"

@implementation CaffeineBeverage

- (void)prepareRecipe
{
    [self boilWater];
    [self brew];
    [self pourInCup];
    if ([self addHook]) {//可选步骤可以用钩子方法让子类去决定。
        [self addCondiments];
    }
}

///第一步的烧水
- (void)boilWater
{
    NSLog(@"烧水");
}

///第三步的倒入水杯
- (void)pourInCup
{
    NSLog(@"倒入水杯了");
}

///钩子方法默认实现
- (BOOL)addHook
{
    return YES;
}

@end
