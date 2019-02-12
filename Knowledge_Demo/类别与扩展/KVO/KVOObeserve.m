//
//  KVOObeserve.m
//  类别与扩展
//
//  Created by 戴运鹏 on 2019/2/12.
//  Copyright © 2019 戴运鹏. All rights reserved.
//

#import "KVOObeserve.h"

@implementation KVOObeserve

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context
{
    NSLog(@"%@",change); 
}

@end
