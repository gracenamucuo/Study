//
//  ParentClass.m
//  Load_Initialize_Demo
//
//  Created by 戴运鹏 on 2018/4/22.
//  Copyright © 2018年 戴运鹏. All rights reserved.
//

#import "ParentClass.h"

@implementation ParentClass

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.name = @"父类赋值";
    }
    return self;
}

- (void)dealloc
{
    self.name = nil;
}
@end
