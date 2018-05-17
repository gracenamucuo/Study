//
//  ConcreteFlyDecrator.m
//  Design_Demo
//
//  Created by 戴运鹏 on 2018/5/17.
//  Copyright © 2018年 戴运鹏. All rights reserved.
//

#import "ConcreteFlyDecrator.h"

@implementation ConcreteFlyDecrator

- (void)move
{
    [super move];
    [self fly];
}

- (void)fly
{
    NSLog(@"飞行装饰者增加飞行的功能");
}

@end
