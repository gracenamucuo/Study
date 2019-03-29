//
//  NSArray+safe.m
//  埋点
//
//  Created by 戴运鹏 on 2019/3/7.
//  Copyright © 2019 戴运鹏. All rights reserved.
//

#import "NSArray+safe.h"
#import "HookUtility.h"
#import <objc/runtime.h>
@implementation NSArray (safe)
//+ (void)load
//{
//    NSLog(@"控制器的load方法");
//    static dispatch_once_t onceToken;
//    dispatch_once(&onceToken, ^{
//        SEL originalSelector = @selector(setObject:atIndexedSubscript:);
//        SEL swizzledSelector = @selector(arrayM_setObject:atIndexedSubscript:);
//        
//        SEL originalDisSel = @selector(insertObject:atIndex:);
//        SEL swizzledDisSel = @selector(arrayM_insertObject:atIndex:);
//        
//        [HookUtility swizzlingInClass:objc_getClass("__NSArrayM") originalSelector:originalSelector swizzledSelector:swizzledSelector];
//        [HookUtility swizzlingInClass:objc_getClass("__NSArrayM") originalSelector:originalDisSel swizzledSelector:swizzledDisSel];
//    });
//}


#pragma mark -- 数组写入
- (void)arrayM_setObject:(id)value atIndexedSubscript:(NSUInteger)index
{
    if (index > self.count - 1 || !value) {
        return;
    }
    
    [self arrayM_setObject:value atIndexedSubscript:index];
}
- (void)arrayM_insertObject:(id)value atIndex:(NSUInteger)index
{
    if (index > self.count || !value) {
        return;
    }
    [self arrayM_insertObject:value atIndex:index];
}
@end
