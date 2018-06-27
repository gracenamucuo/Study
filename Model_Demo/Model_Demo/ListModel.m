//
//  ListModel.m
//  Model_Demo
//
//  Created by 戴运鹏 on 2018/6/27.
//  Copyright © 2018年 戴运鹏. All rights reserved.
//

#import "ListModel.h"

@implementation ListTotalModel

+ (nullable NSDictionary<NSString *, id> *)modelContainerPropertyGenericClass
{
    return @{@"list":[ListModel class]};
}

@end

@implementation ListModel

@end
