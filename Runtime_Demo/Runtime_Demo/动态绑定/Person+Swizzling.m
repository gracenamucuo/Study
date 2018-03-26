//
//  Person+Swizzling.m
//  Runtime_Demo
//
//  Created by 戴运鹏 on 2018/3/25.
//  Copyright © 2018年 戴运鹏. All rights reserved.
//

#import "Person+Swizzling.h"
#import <objc/runtime.h>
@implementation Person (Swizzling)

+ (void)load
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Class class = [self class];
        SEL originalSlector = @selector(speak);
        SEL swizzledSelector = @selector(swizzling);
        Method originalMethod = class_getInstanceMethod(class, originalSlector);
        Method swizzledMethod = class_getInstanceMethod(class, swizzledSelector);
        
        BOOL didAddMethod = class_addMethod(class, originalSlector, method_getImplementation(swizzledMethod), method_getTypeEncoding(swizzledMethod));
        
        if (didAddMethod) {
            class_replaceMethod(class, swizzledSelector, method_getImplementation(originalMethod), method_getTypeEncoding(originalMethod));
            
            
        }else{
            method_exchangeImplementations(originalMethod, swizzledMethod);
        }
        
    });
}

- (void)swizzling
{
    NSLog(@"替换的实现");
}

@end
