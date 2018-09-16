//
//  Student.m
//  Sqlite_Demo
//
//  Created by 戴运鹏 on 2018/9/16.
//  Copyright © 2018年 戴运鹏. All rights reserved.
//

#import "Student.h"

@implementation Student
+ (NSString *)primaryKey
{
    return @"stuNum";
}

+ (NSArray *)ignoreColumnNames
{
    return @[@"score"];
}

+ (NSDictionary *)newNameToOldNameDic
{
    return @{@"age":@"age2"};//把原来的age2改为新的age
}

@end
