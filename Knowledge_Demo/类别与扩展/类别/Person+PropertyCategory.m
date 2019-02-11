//
//  Person+PropertyCategory.m
//  类别与扩展
//
//  Created by 戴运鹏 on 2019/1/25.
//  Copyright © 2019 戴运鹏. All rights reserved.
//

#import "Person+PropertyCategory.h"
#import <objc/runtime.h>

static NSString *nameWithRuntimeKey = @"nameWithRuntimeKey";
@implementation Person (PropertyCategory)
- (void)setNameWithRuntime:(NSString *)nameWithRuntime
{
    objc_setAssociatedObject(self, &nameWithRuntimeKey, nameWithRuntime, OBJC_ASSOCIATION_COPY);
}

- (NSString *)nameWithRuntime
{
    return objc_getAssociatedObject(self, &nameWithRuntimeKey);
}


- (void)originalMethod
{
    //===
}

//验证当对象本身置为nil的时候，其关联对象是否销毁

- (void)setAssociateSon:(Son *)associateSon
{
    objc_setAssociatedObject(self, @selector(associateSon), associateSon, OBJC_ASSOCIATION_RETAIN);
}

- (Son *)associateSon
{
    return objc_getAssociatedObject(self, @selector(associateSon));
}
@end
