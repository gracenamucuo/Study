//
//  ChickenOrder.m
//  Design_Demo
//
//  Created by 戴运鹏 on 2018/5/23.
//  Copyright © 2018年 戴运鹏. All rights reserved.
//

#import "ChickenOrder.h"
#import "Worker.h"
@implementation ChickenOrder

- (void)executeOrder
{
    NSLog(@"炸鸡");
    [[Worker sharedWorker]makeChickenWorK:self.orderString];
}

@end
