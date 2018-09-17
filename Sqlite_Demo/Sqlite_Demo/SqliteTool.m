//
//  SqliteTool.m
//  Sqlite_Demo
//
//  Created by 戴运鹏 on 2018/9/15.
//  Copyright © 2018年 戴运鹏. All rights reserved.
//

#import "SqliteTool.h"
#import "sqlite3.h"
#define kCachePath NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES).firstObject
sqlite3 *ppdb = nil;
@implementation SqliteTool

+ (BOOL)deal:(NSString *)sql user_id:(NSString *)user_id
{

    //1，创建或打开一个数据库

    if (![self openDB:user_id]) {
        NSLog(@"打开数据库失败");
        return NO;
    }
    //2.执行语句
    BOOL result = sqlite3_exec(ppdb, sql.UTF8String, nil, nil, nil) == SQLITE_OK;
    //3.关闭数据库
    [self closeDB];
    
    return result;
    
}

+ (NSMutableArray<NSMutableDictionary *> *)querySql:(NSString *)sql user_id:(NSString *)user_id
{
    [self openDB:user_id];
    //预处理语句
    //1.创建准备语句
    //参数1: 一个已经打开的数据库
    //参数2:需要的sql
    //参数3:参数2中取出多少字节的长度 -1 自动计算\0
    //参数4:准备语句
    //参数5:通过参数3,取出参数2的长度字节后，剩下的字符串、
    sqlite3_stmt *ppStmt;
    if (sqlite3_prepare_v2(ppdb, sql.UTF8String, -1, &ppStmt, nil)!= SQLITE_OK) {
        NSLog(@"准备语句编译失败");
        return nil;
    }
    //2 绑定数据:
    //3：执行
    NSMutableArray *arr = [NSMutableArray array];
    while (sqlite3_step(ppStmt) == SQLITE_ROW) {
        //一行记录 --》字典
        //1。获取所有列的个数
        int columnCount = sqlite3_column_count(ppStmt);
        //2.遍历所有的列
        for (int i = 0;  i < columnCount; i++) {
            NSMutableDictionary *dic = [NSMutableDictionary dictionary];
            [arr addObject:dic];
            //2.1获取列名
            const char *columnNameC = sqlite3_column_name(ppStmt, i);
            NSString *columnName = [NSString stringWithUTF8String:columnNameC];
            //2.2获取列值。 不同的类型，使用不同的函数，进行获取
            //2.2.1获取列的类型
            int type = sqlite3_column_type(ppStmt, i);
            id value = nil;
            switch (type) {
                case SQLITE_INTEGER:
                    value = @(sqlite3_column_int(ppStmt, i));
                    break;
                case SQLITE_FLOAT:
                    value = @(sqlite3_column_double(ppStmt, i));
                    break;
                case SQLITE_BLOB:
                    value = CFBridgingRelease(sqlite3_column_blob(ppStmt, i));
                    break;
                case SQLITE_NULL:
                    value = @"";
                    break;
                case SQLITE3_TEXT:
                    value = [NSString stringWithUTF8String:(const char*)sqlite3_column_text(ppStmt, i)];
                    break;
                default:
                    break;
            }
            [dic setValue:value forKey:columnName];

        }

    }
    //4重置
    //5释放资源
    sqlite3_finalize(ppStmt);
    [self closeDB];
    return arr;
}

#pragma mark -- private
+ (BOOL)openDB:(NSString*)user_id
{
    NSString *dbName = @"common.sqlite";
    if (user_id.length !=0) {
        dbName = [NSString stringWithFormat:@"%@.sqlite",user_id];
    }
    NSString *dbPath = [kCachePath stringByAppendingString:dbName];
    return sqlite3_open(dbPath.UTF8String, &ppdb)!= SQLITE_OK;
}

+ (void)closeDB
{
    sqlite3_close(ppdb);
}

@end



































