//
//  Customer.m
//  Design_Demo
//
//  Created by 戴运鹏 on 2018/5/23.
//  Copyright © 2018年 戴运鹏. All rights reserved.
//

#import "Customer.h"
#import "MuttonOrder.h"
#import "ChickenOrder.h"
#import "DuckOrder.h"
#import "Waiter.h"
@implementation Customer

-  (OrderPatternAbstractOrder *)placeAnOrderWithOrderString:(NSString *)orderString type:(orderType)type
{
    switch (type) {
        case orderType_mutton:
            return [[MuttonOrder alloc]initWithOrderString:orderString];
            break;
        case orderType_chicken:
            return [[ChickenOrder alloc]initWithOrderString:orderString];
        case orderType_Duck:
            return [[DuckOrder alloc]initWithOrderString:orderString];
        default:
            break;
    }
    return nil;
}

- (void)setCommandWithOrder:(OrderPatternAbstractOrder *)command
{
    Waiter *waiter = [[Waiter alloc]init];
    [waiter addOrder:command];
    [waiter executeOrder];
}

@end
