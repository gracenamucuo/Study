//
//  MuttonOrder.m
//  Design_Demo
//
//  Created by 戴运鹏 on 2018/5/23.
//  Copyright © 2018年 戴运鹏. All rights reserved.
//

#import "MuttonOrder.h"
#import "Worker.h"
@implementation MuttonOrder

@synthesize orderString = _orderString;


- (void)executeOrder
{
    NSLog(@"烤羊肉");
    [[Worker sharedWorker]makeMuttonWork:self.orderString];
}

@end
