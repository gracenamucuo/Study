//
//  UIViewController+Swizzling.m
//  Runtime_Demo
//
//  Created by 戴运鹏 on 2018/3/23.
//  Copyright © 2018年 戴运鹏. All rights reserved.
//

#import "UIViewController+Swizzling.h"
#import <objc/runtime.h>
@implementation UIViewController (Swizzling)

+ (void)load
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Class class = [self class];
        SEL originalSlector = @selector(viewWillAppear:);
        SEL swizzledSelector = @selector(runtime_viewWillAppear:);
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

- (void)runtime_viewWillAppear:(BOOL)animated
{
    [self runtime_viewWillAppear:animated];
    NSLog(@"viewWillAppear:%@",self);
}

@end





































