//
//  Student.m
//  Runtime_Demo
//
//  Created by 戴运鹏 on 2018/3/26.
//  Copyright © 2018年 戴运鹏. All rights reserved.
//

#import "Student.h"

@implementation Student

- (NSString *)description
{
    NSLog(@"current pointer = %p",self);
    NSLog(@"age pointer = %p",&age);
    return [NSString stringWithFormat:@"age = %d",age];
}

@end







