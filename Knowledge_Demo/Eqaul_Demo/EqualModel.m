//
//  EqualModel.m
//  Eqaul_Demo
//
//  Created by 戴运鹏 on 2019/2/28.
//  Copyright © 2019 戴运鹏. All rights reserved.
//

#import "EqualModel.h"

@implementation EqualModel


- (BOOL)isEqualToModel:(EqualModel *)model {
    if (!model) {
        return NO;
    }
    
    BOOL haveEqualNames = (!self.name && !model.name) || [self.name isEqualToString:model.name];
    BOOL haveEqualIdentifers = self.identifier == model.identifier;
    
    return haveEqualNames && haveEqualIdentifers;
//    return self == model;
}

- (BOOL)isEqual:(id)object {
    NSLog(@"走了isEqual");
    if (self == object) {
        return YES;
    }
    
    if (![object isKindOfClass:[EqualModel class]]) {
        return NO;
    }
    
    return [self isEqualToModel:(EqualModel *)object];
}


- (NSUInteger)hash
{
    NSLog(@"走了hash");
    return self.name.hash ^ self.identifier;
}

- (id)copyWithZone:(nullable NSZone *)zone
{
    EqualModel *model = [[self class] allocWithZone:zone];
    model.name = _name;
    model.identifier = _identifier;
    
    NSLog(@"走了copyWithZone方法");
    return model;
}

- (id)copy
{
    NSLog(@"走了copy的方法");
    return [super copy];
}


@end
