//
//  DuckOrder.m
//  Design_Demo
//
//  Created by 戴运鹏 on 2018/5/23.
//  Copyright © 2018年 戴运鹏. All rights reserved.
//

#import "DuckOrder.h"
#import "Worker.h"
@implementation DuckOrder

- (void)executeOrder
{
    NSLog(@"煮鸭子");
    [[Worker sharedWorker]makeDuckWork:self.orderString];
}

@end
