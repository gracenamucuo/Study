//
//  Son.m
//  Runtime_Demo
//
//  Created by 戴运鹏 on 2018/3/22.
//  Copyright © 2018年 戴运鹏. All rights reserved.
//

#import "Son.h"
#import <objc/runtime.h>
@implementation Son

- (instancetype)init
{
    self = [super init];
    if (self) {
        NSLog(@"self---------%@",[self class]);
        NSLog(@"super---------%@",[super class]);
        class_getSuperclass([self class]);
        NSLog(@"-----");
    }
    return self;
}

@end
