//
//  Person+WeakAssociated.m
//  Knowledge_Demo
//
//  Created by 戴运鹏 on 2019/1/25.
//  Copyright © 2019 戴运鹏. All rights reserved.
//

#import "Person+WeakAssociated.h"
#import <objc/runtime.h>
@implementation Person (WeakAssociated)


- (void)setWeakSon:(Son *)weakSon
{
    id __weak weakObj = weakSon;
    id (^block)() = ^{return weakObj;};
    objc_setAssociatedObject(self, @selector(weakSon), block, OBJC_ASSOCIATION_COPY);
}
- (Son*)weakSon
{
    id (^block)() = objc_getAssociatedObject(self, @selector(weakSon));
    id curWeakSon = block ? block() : nil;
    return curWeakSon;
}

@end
