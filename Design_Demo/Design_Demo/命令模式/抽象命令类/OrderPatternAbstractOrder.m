//
//  OrderPatternAbstractOrder.m
//  Design_Demo
//
//  Created by 戴运鹏 on 2018/5/23.
//  Copyright © 2018年 戴运鹏. All rights reserved.
//

#import "OrderPatternAbstractOrder.h"

@implementation OrderPatternAbstractOrder

- (instancetype)initWithOrderString:(NSString *)orderString
{
    if (self = [super init]) {
        self.orderString = orderString;
    }
    return self;
}

@end
