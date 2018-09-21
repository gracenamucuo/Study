//
//  ETIMDataBaseManager.h
//  DataBaseDemo
//
//  Created by 戴运鹏 on 2018/9/19.
//  Copyright © 2018年 戴运鹏. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ETIMDataBaseManager : NSObject

+ (instancetype)shareDatabaseManager;

/**
 创建数据库
 数据库默认创建在[[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:@"EasySaleIM"];文件夹下
 @param dbName 数据库名称
 @return 是否创建成功
 */
- (BOOL)createDataBase:(NSString*)dbName;

/**
 在某个数据库里创建一个表

 @param tableName 表名
 @param dbName 数据库名称
 @param cls 要存入的model的类
 @return 是否创建成功
 */
- (BOOL)createTable:(NSString *)tableName inDataBase:(NSString*)dbName modelCls:(Class)cls;
/**
 在某个数据库里创建一个表
 
 @param tableName 表名
 @param dbName 数据库名称
 @param cls 要存入的model的类
 @param nameArr 要忽略的model的属性 如:nameArr = @[@"name"],则不允许名为name的属性/key 生成表的字段
 @return 是否创建成功
 */
- (BOOL)createTable:(NSString *)tableName inDataBase:(NSString*)dbName modelCls:(Class)cls excludeName:(NSArray *)nameArr;


/**
 在某个数据库的表中插入一条数据

 @param tableName 表名
 @param dbName 数据库名称
 @param parameters 插入的model
 @return 是否插入成功
 */
- (BOOL)insertTable:(NSString *)tableName inDataBase:(NSString*)dbName model:(id)parameters;

/**
 批量插入

 @param tableName 表名
 @param dbName 数据库名
 @param modelArray 装有model的array
 @return 返回没有插入的model的下标的数组。
 */
- (NSArray *)insertTable:(NSString *)tableName inDataBase:(NSString*)dbName modelArray:(NSArray *)modelArray;

/**
 最后一条数据的主键

 @param dbName 数据库
 @param tableName 表名
 @return 最后一条数据主键
 */
- (NSInteger)lastInsertPrimaryKeyIDTableName:(NSString *)tableName inDataBase:(NSString *)dbName;


/**
某张表的总的数据数

 @param dbName 数据库名称
 @param tableName 表名
 @return 数据总数
 */
- (NSInteger)totalCountTableName:(NSString *)tableName InDataBase:(NSString *)dbName;

/**
 根据条件删除表中的一些数据

 @param dbName 数据库名
 @param tableName 表名
 @param format 条件语句
 @return 是否删除成功
 */
- (BOOL)deleteTable:(NSString *)tableName inDataBase:(NSString *)dbName whereFormat:(NSString *)format;


/**
 删除表

 @param tableName 表名
 @param dbName 数据库名
 @return 是否删除成功
 */
- (BOOL)deleteTable:(NSString *)tableName inDataBase:(NSString *)dbName;


/**
 删除数据库

 @param dbName 数据库名称
 @return 是否成功
 */
- (BOOL)deleteDataBase:(NSString *)dbName;

/**
 查找数据

 @param tableName 表名
 @param dbName 数据库名
 @param cls 查找的每一条数据映射的model
 @param format 条件语句
 @return 查找的数组
 */
- (NSArray *)lookUpTable:(NSString *)tableName inDataBase:(NSString *)dbName model:(Class)cls whereFormat:(NSString *)format;


/**
 更改某条数据

 @param tableName 表名
 @param dbName 数据库名
 @param model 新的model
 @param format 条件语句
 @return 是否更高成功
 */
- (BOOL)modifyTable:(NSString *)tableName inDataBase:(NSString *)dbName model:(id)model whereFormat:(NSString *)format;

/**
更新字段

 @param tableName 表名
 @param dbName 数据库名
 @param cls 新的model的类型
 @param nameArr 不想更新的字段
 @return 是否成功
 */
- (BOOL)alterTable:(NSString *)tableName inDataBase:(NSString *)dbName model:(Class)cls excludeName:(NSArray *)nameArr;
/**
 返回当前目录下的所有数据库

 @return 数据库路径下的所有文件名
 */
- (NSArray *)allDBNames;


/**
 获取当前记录的前十条记录

 @param pkid 当前数据的pkid
 @return 数组 小于等于10
 */
- (NSArray *)acquireTenModelsBeforeModel:(id)model tableName:(NSString *)tableName inDataBase:(NSString *)dbName;



@end

NS_ASSUME_NONNULL_END
