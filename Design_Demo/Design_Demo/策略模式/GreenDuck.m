//
//  GreenDuck.m
//  Design_Demo
//
//  Created by 戴运鹏 on 2018/6/8.
//  Copyright © 2018年 戴运鹏. All rights reserved.
//

#import "GreenDuck.h"

@interface GreenDuck()

@property (nonatomic,strong)id <StrategyBehaviorProtocol> behavior;

@end

@implementation GreenDuck

- (instancetype)initWithBehavior:(id<StrategyBehaviorProtocol>)behavior
{
    if (self = [super init]) {
        _behavior = behavior;
    }
    return self;
}

- (void)display
{
    NSLog(@"我是绿色鸭子");
    [self.behavior quack];
}

@end
