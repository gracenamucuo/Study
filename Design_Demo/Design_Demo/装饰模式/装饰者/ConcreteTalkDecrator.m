//
//  ConcreteTalkDecrator.m
//  Design_Demo
//
//  Created by 戴运鹏 on 2018/5/17.
//  Copyright © 2018年 戴运鹏. All rights reserved.
//

#import "ConcreteTalkDecrator.h"

@implementation ConcreteTalkDecrator

- (void)move
{
    [super move];
    [self talk];
}

- (void)talk
{
    NSLog(@"talk装饰者增加了讲话的功能");
}

@end
