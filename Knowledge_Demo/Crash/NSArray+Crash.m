//
//  NSArray+Crash.m
//  Crash
//
//  Created by 戴运鹏 on 2019/2/15.
//  Copyright © 2019 戴运鹏. All rights reserved.
//

#import "NSArray+Crash.h"
#import "Helper.h"
#import <objc/runtime.h>
@implementation NSArray (Crash)

+ (void)load
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
    [Helper swizzlingInClass:objc_getClass(@selector(__NSArrayI)) originalSelector:@selector(objectAtIndex:) swizzledSelector:@selector(swizz_objectAtIndex:)];
        
    [Helper swizzlingInClass:objc_getClass(@selector(__NSArrayI)) originalSelector:@selector(objectAtIndexedSubscript:) swizzledSelector:@selector(swizz_objectAtIndexedSubscript:)];
    });
    

}

- (id)swizz_objectAtIndex:(NSUInteger)index{
    if (self.count-1 < index) {
        @try {
            return [self swizz_objectAtIndex:index];
        } @catch (NSException *exception) {

            return nil;
        } @finally {
            
        }
    }else{
        return [self swizz_objectAtIndex:index];
    }
}

- (id)swizz_objectAtIndexedSubscript:(NSUInteger)index{
    if (self.count-1 < index) {
        @try {
            return [self swizz_objectAtIndexedSubscript:index];
        } @catch (NSException *exception) {
            NSLog(@"---下标崩溃异常-----");
            return nil;
        } @finally {
            
        }
    }else{
        return [self swizz_objectAtIndexedSubscript:index];
    }
}
@end
