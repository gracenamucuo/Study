//
//  Person+TestCategory.m
//  Runtime_Demo
//
//  Created by 戴运鹏 on 2018/3/26.
//  Copyright © 2018年 戴运鹏. All rights reserved.
//

#import "Person+TestCategory.h"

#import <objc/runtime.h>
@implementation Person (TestCategory)

- (NSString *)age
{
    return objc_getAssociatedObject(self, @selector(age));
}

- (void)setAge:(NSString *)age
{
    objc_setAssociatedObject(self, @selector(age), age, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (void)testCategory
{
    NSLog(@"=========");
}

@end
