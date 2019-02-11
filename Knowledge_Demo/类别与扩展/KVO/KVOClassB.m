//
//  KVOClassB.m
//  类别与扩展
//
//  Created by 戴运鹏 on 2019/2/11.
//  Copyright © 2019 戴运鹏. All rights reserved.
//

#import "KVOClassB.h"

@implementation KVOClassB

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context
{
    NSLog(@"B接收到变化");
}

- (NSString *)classssss
{
    return @"classssss";
}

- (void)setClassssss
{
    
}

@end
