//
//  Son.m
//  DataAccess_Demo
//
//  Created by 戴运鹏 on 2018/6/23.
//  Copyright © 2018年 戴运鹏. All rights reserved.
//

#import "Son.h"

@implementation Son
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super init]) {
        _fav = [aDecoder decodeObjectForKey:@"fav"];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:self.fav forKey:@"fav"];
}
@end
