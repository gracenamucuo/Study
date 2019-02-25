//
//  Person.m
//  C语言
//
//  Created by 戴运鹏 on 2019/2/21.
//  Copyright © 2019 戴运鹏. All rights reserved.
//

#import "Person.h"

@implementation Person

- (instancetype)init
{
    self = [super init];
    if (self) {
        _name = @"1";
//        _age = @"2";
//        _sex = @"3";
//        _height = 50;
//        _width = 50;
    }
    return self;
}

+ (void)staticMethod
{
    NSLog(@"person");
}

@end
