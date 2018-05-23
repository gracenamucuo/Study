//
//  Waiter.m
//  Design_Demo
//
//  Created by 戴运鹏 on 2018/5/23.
//  Copyright © 2018年 戴运鹏. All rights reserved.
//

#import "Waiter.h"

@interface Waiter()
@property (nonatomic,strong)NSMutableArray *orderList;
@end

@implementation Waiter

- (instancetype)init
{
    self = [super init];
    if (self) {
        _orderList = [NSMutableArray array];
    }
    return self;
}

- (void)addOrder:(OrderPatternAbstractOrder *)order
{
    [self.orderList addObject:order];
}

- (void)deleteOrder:(OrderPatternAbstractOrder *)order
{
    if ([self.orderList containsObject:order]) {
        [self.orderList removeObject:order];
    }
}

/**
 执行命令
 */
- (void)executeOrder
{
    for (OrderPatternAbstractOrder *order in self.orderList) {
        [order executeOrder];
    }
}

@end
