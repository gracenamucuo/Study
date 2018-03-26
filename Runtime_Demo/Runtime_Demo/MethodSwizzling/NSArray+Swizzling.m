//
//  NSArray+Swizzling.m
//  Runtime_Demo
//
//  Created by 戴运鹏 on 2018/3/23.
//  Copyright © 2018年 戴运鹏. All rights reserved.
//

#import "NSArray+Swizzling.h"
#import <objc/runtime.h>
@implementation NSArray (Swizzling)

+ (void)load
{
    Method original = class_getInstanceMethod(objc_getClass("__NSArrayI"), @selector(objectAtIndex:));
    Method replace = class_getInstanceMethod(objc_getClass("__NSArrayI"), @selector(swizzling_objectAtIndex:));
    method_exchangeImplementations(original, replace);
}

/*
 调用这个objc_getClass方法的时候，要先知道类对应的真实的类名才行，NSArray其实在Runtime中对应着__NSArrayI，NSMutableArray对应着__NSArrayM，NSDictionary对应着__NSDictionaryI，NSMutableDictionary对应着__NSDictionaryM。
 

 */

- (void)swizzling_objectAtIndex:(NSUInteger)index
{
    if (self.count - 1 < index) {
        @try{
            return [self swizzling_objectAtIndex:index];
        }
        
        @catch(NSException *exception){
            NSLog(@"-------%s Crash Because Method%s------\n",class_getName(self.class),__func__);
            NSLog(@"%@",[exception callStackSymbols]);
            return;
        }
        
        @finally{}
    }else{
        return [self swizzling_objectAtIndex:index];
    }
}


@end








