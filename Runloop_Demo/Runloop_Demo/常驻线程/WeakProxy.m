//
//  WeakProxy.m
//  Runloop_Demo
//
//  Created by 戴运鹏 on 2018/11/5.
//  Copyright © 2018 戴运鹏. All rights reserved.
//

#import "WeakProxy.h"

@implementation WeakProxy

- (instancetype)initWithTarget:(id)target
{
    self = [super init];
    if (self) {
        _target = target;
    }
    return self;
}

+ (instancetype)proxyWithTarget:(id)target
{
    return [[WeakProxy alloc]initWithTarget:target];
}

- (id)forwardingTargetForSelector:(SEL)aSelector
{
    return _target;
}

@end
