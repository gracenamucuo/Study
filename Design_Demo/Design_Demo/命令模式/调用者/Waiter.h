//
//  Waiter.h
//  Design_Demo
//
//  Created by 戴运鹏 on 2018/5/23.
//  Copyright © 2018年 戴运鹏. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "OrderPatternAbstractOrder.h"
@interface Waiter : NSObject//负责调用命令

- (void)addOrder:(OrderPatternAbstractOrder *)order;
- (void)deleteOrder:(OrderPatternAbstractOrder *)order;
- (void)executeOrder;
@end
