//
//  NSObject+Perform.m
//  埋点
//
//  Created by 戴运鹏 on 2019/3/18.
//  Copyright © 2019 戴运鹏. All rights reserved.
//

#import "NSObject+Perform.h"
#import "HookUtility.h"
#import <objc/runtime.h>
@implementation NSObject (Perform)

+ (void)load
{
    NSLog(@"控制器的load方法");
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        SEL originalSelector = @selector(doesNotRecognizeSelector:);
        SEL swizzledSelector = @selector(sw_doesNotRecognizeSelector:);
        
        
        
        
        [HookUtility swizzlingInClass:self originalSelector:originalSelector swizzledSelector:swizzledSelector];
        
    });
}

- (void)sw_doesNotRecognizeSelector:(SEL)aSelector
{
    NSLog(@"啥也不干");
//    [self doesNotRecognizeSelector:aSelector];
}


@end
