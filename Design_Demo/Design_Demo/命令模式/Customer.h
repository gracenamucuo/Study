//
//  Customer.h
//  Design_Demo
//
//  Created by 戴运鹏 on 2018/5/23.
//  Copyright © 2018年 戴运鹏. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "OrderPatternAbstractOrder.h"
typedef NS_ENUM(NSUInteger,orderType) {
    orderType_mutton,
    orderType_chicken,
    orderType_Duck
};

@interface Customer : NSObject

- (OrderPatternAbstractOrder *)placeAnOrderWithOrderString:(NSString *)orderString type:(orderType)type;

- (void)setCommandWithOrder:(OrderPatternAbstractOrder*)command;

@end
