//
//  XMGModelTool.h
//  sqlite的基本封装
//
//  Created by 王顺子 on 16/12/5.
//  Copyright © 2016年 小码哥. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol XMGSqliteModelToolDelegate <NSObject>

- (NSString *)primaryKey;

- (NSArray *)ignoreIvarNames;

- (NSDictionary *)renameDic;

@end

@interface XMGModelTool : NSObject

/**
 获取表格名称
 */
+ (NSString *)getTableNameWithModelClass: (Class)cls;
/**
 获取临时表格名称
 */
+ (NSString *)getTempTableNameWithModelClass: (Class)cls;
/**
 获取模型会被创建成为表格的  成员变量名称和类型组成的字典
 {key: 成员变量名称,取出下划线  value: 值}
 类型: runtime获取的类型
 */
+ (NSDictionary *)getModelIvarNameIvarTypeDic: (Class)cls;
/**
 获取模型里面, 需要创建表格的所有字段/类型, 组成的数组
 */
+ (NSDictionary *)getModelIvarNameSqlTypeDic: (Class)cls;
/**
 获取模型里面所有的字段
 */
+ (NSArray <NSString *> *)getModelIvarNames: (Class)cls;

@end
