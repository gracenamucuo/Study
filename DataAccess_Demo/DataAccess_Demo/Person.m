//
//  Person.m
//  DataAccess_Demo
//
//  Created by 戴运鹏 on 2018/6/22.
//  Copyright © 2018年 戴运鹏. All rights reserved.
//

#import "Person.h"

@implementation Person

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super init]) {
        _name = [aDecoder decodeObjectForKey:@"name"];
       _age = [aDecoder decodeObjectForKey:@"age"];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:_name forKey:@"name"];
    [aCoder encodeObject:_age forKey:@"age"];
}

@end
