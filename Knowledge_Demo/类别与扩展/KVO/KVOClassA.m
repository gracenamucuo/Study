//
//  KVOClassA.m
//  类别与扩展
//
//  Created by 戴运鹏 on 2019/2/11.
//  Copyright © 2019 戴运鹏. All rights reserved.
//

#import "KVOClassA.h"

@implementation KVOClassA

- (void)setValue:(NSUInteger)value
{
    _value = value;
}

- (IMP)imp
{
    return [self methodForSelector:@selector(setValue:)];
}

- (IMP)classImp
{
    return [self methodForSelector:@selector(class)];
}
@end
