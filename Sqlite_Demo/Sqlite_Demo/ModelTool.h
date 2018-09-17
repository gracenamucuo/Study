//
//  ModelTool.h
//  Sqlite_Demo
//
//  Created by 戴运鹏 on 2018/9/16.
//  Copyright © 2018年 戴运鹏. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ModelTool : NSObject
+ (NSString *)tableName:(Class)cls;

//所有成员变量，及成员变量的类型而不是属性。
+ (NSDictionary *)classIvarNameTypeDic:(Class)cls;

//所有成员变量 以及映射到sqlite的类型
+ (NSDictionary *)classIvarNameSqliteTypeDic:(Class)cls;

+ (NSString *)columnNameAndTypesStr:(Class)cls;

+ (NSArray *)allTableSortedIvarName:(Class)cls;
@end
