
//
//  SqliteModelTool.m
//  Sqlite_Demo
//
//  Created by 戴运鹏 on 2018/9/16.
//  Copyright © 2018年 戴运鹏. All rights reserved.
//

#import "SqliteModelTool.h"
#import "ModelTool.h"
#import "SqliteTool.h"
#import "TableTool.h"
@implementation SqliteModelTool
//方案:1基于配置（plist文件） 2 基于runtime 
+ (BOOL)createTable:(Class)cls uid:(NSString *)uid
{
    //1创建表格的sql语句
    //尽肯能多的自动获取model的所有属性，需要的一些信息让外界告诉
    //create table if not exists 表名(字段1 字段1类型(约束),字段2 字段2类型(约束)，…………，primary key(字段))
    //1.1获取表格名称
    NSString *tableName = [ModelTool tableName:cls];
    if (![cls respondsToSelector:@selector(primaryKey)]) {
        NSLog(@"主键");
        return NO;
    }
    NSString *primary = [cls primaryKey];
    //1.2获取一个模型里所有的字段以及类型
    NSString *createTableSql = [NSString stringWithFormat:@"create table if not exists %@(%@,primary key (%@))",tableName,[ModelTool columnNameAndTypesStr:cls],primary];
    //2执行
    return [SqliteTool deal:createTableSql user_id:@"12"];
}
+ (BOOL)isTableRequiredUpdate:(Class)cls uid:(NSString *)uid
{
    NSArray *modelNames = [ModelTool allTableSortedIvarName:cls];
    NSArray *tableNames = [TableTool tableSortedColumnNamesCls:cls uid:uid];
    return [modelNames isEqualToArray:tableNames];
}


@end














































































































































































































































































































