//
//  Person.m
//  DataAccess_Demo
//
//  Created by 戴运鹏 on 2018/6/22.
//  Copyright © 2018年 戴运鹏. All rights reserved.
//

#import "Person.h"
#import "Food.h"

@interface Person()
@property (nonatomic,copy)NSString *private;
@end

@implementation Person

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super init]) {
        _name = [aDecoder decodeObjectForKey:@"name"];
       _age = [aDecoder decodeObjectForKey:@"age"];
        _food = [aDecoder decodeObjectForKey:@"food"];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:self.name forKey:@"name"];
    [aCoder encodeObject:self.age forKey:@"age"];
    [aCoder encodeObject:self.food forKey:@"food"];
}



@end
