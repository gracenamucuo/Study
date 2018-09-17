//
//  ModelTool.m
//  Sqlite_Demo
//
//  Created by 戴运鹏 on 2018/9/16.
//  Copyright © 2018年 戴运鹏. All rights reserved.
//

#import "ModelTool.h"
#import <objc/runtime.h>
#import "ModelProtocol.h"
@implementation ModelTool
+ (NSString *)tableName:(Class)cls
{
    return NSStringFromClass(cls);
}

//有效的成员变量名称 以及类型
+ (NSDictionary *)classIvarNameTypeDic:(Class)cls
{
        //获取类里所有成员变量以及类型
    unsigned int outCount = 0;
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
   Ivar *varList = class_copyIvarList(cls, &outCount);
    for (int i = 0; i < outCount; i++) {
        Ivar ivar = varList[i];
        //获取成员变量名称
        NSString *ivarName = [NSString stringWithUTF8String:ivar_getName(ivar)];
        if ([ivarName hasPrefix:@"_"]) {
            ivarName = [ivarName substringFromIndex:1];
        }
        NSArray *ignoreName = @[];
        if ([cls respondsToSelector:@selector(ignoreColumnNames)]) {
            ignoreName = [cls ignoreColumnNames];
        }
        if ([ignoreName containsObject:ivarName]) {
            continue;
        }
        
        //获取成员变量类型
        NSString *type = [NSString stringWithUTF8String:ivar_getTypeEncoding(ivar)];
      type = [type stringByTrimmingCharactersInSet:[NSCharacterSet characterSetWithCharactersInString:@"@\""]];
        [dic setValue:type forKey:ivarName];
    }
    return dic;
}

+ (NSDictionary *)classIvarNameSqliteTypeDic:(Class)cls
{
    NSMutableDictionary *dic = [[self classIvarNameTypeDic:cls] mutableCopy];
    NSDictionary *typeDic = [self ocTypeToSqliteType];
    [dic enumerateKeysAndObjectsUsingBlock:^(NSString *key, NSString *obj, BOOL * _Nonnull stop) {
        dic[key] = typeDic[obj];
    }];
    return dic;
}

+ (NSString *)columnNameAndTypesStr:(Class)cls
{
    NSDictionary *nameTypeDic = [self classIvarNameSqliteTypeDic:cls];
    NSMutableArray *result = [NSMutableArray array];
    [nameTypeDic enumerateKeysAndObjectsUsingBlock:^(NSString *key, NSString *obj, BOOL * _Nonnull stop) {
        [result addObject:[NSString stringWithFormat:@"%@ %@",key,obj]];
    }];
    return [result componentsJoinedByString:@","];
}

+ (NSArray *)allTableSortedIvarName:(Class)cls
{
    NSDictionary *dic = [self classIvarNameTypeDic:cls];
    NSArray *keys = dic.allKeys;
    [keys sortedArrayUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
        return [obj1 compare:obj2];
    }];
    return keys;
}

#pragma mark -- private
+ (NSDictionary *)ocTypeToSqliteType
{
    return @{@"d":@"real",//double
             @"g":@"real",//float
             @"i":@"integer",//int
             @"q":@"integer",//long
             @"Q":@"integer",//long long
             @"B":@"integer",//bool
             @"NSData":@"blob",
             @"NSDictionary":@"text",
             @"NSMutableDictionary":@"text",
             @"NSArray":@"blob",
             @"NSMutableArray":@"blob",
             @"NSString":@"text"
             };
    
}
@end



































































