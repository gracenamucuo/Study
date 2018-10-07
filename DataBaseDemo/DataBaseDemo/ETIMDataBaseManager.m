//
//  ETIMDataBaseManager.m
//  DataBaseDemo
//
//  Created by 戴运鹏 on 2018/9/19.
//  Copyright © 2018年 戴运鹏. All rights reserved.
//

#import "ETIMDataBaseManager.h"
#import "JQFMDB.h"

#define DBNAME  if (![dbName hasSuffix:@"sqlite"]) {\
dbName = [dbName stringByAppendingString:@".sqlite"];\
}\

@implementation ETIMDataBaseManager
static ETIMDataBaseManager *manager = nil;
+ (instancetype)shareDatabaseManager
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[ETIMDataBaseManager alloc]init];
    });
    return manager;
}

- (BOOL)createDataBase:(NSString *)dbName
{
    DBNAME
    JQFMDB *fmdb = [[JQFMDB alloc]initWithDBName:dbName path:[self createDir]];
    return fmdb;
}

- (BOOL)createTable:(NSString *)tableName inDataBase:(NSString *)dbName modelCls:(Class)cls
{
    DBNAME
    JQFMDB *fmdb = [[JQFMDB alloc]initWithDBName:dbName path:[self createDir]];
    BOOL success = [fmdb jq_createTable:tableName dicOrModel:[cls new] excludeName:nil];
    return success;
}

- (BOOL)createTable:(NSString *)tableName inDataBase:(NSString *)dbName modelCls:(Class)cls excludeName:(NSArray *)nameArr
{
    DBNAME
    JQFMDB *fmdb = [[JQFMDB alloc]initWithDBName:dbName path:[self createDir]];
    BOOL success = [fmdb jq_createTable:tableName dicOrModel:[cls new] excludeName:nameArr];
    return success;
}

- (BOOL)insertTable:(NSString *)tableName inDataBase:(NSString *)dbName model:(id)parameters
{
    DBNAME
    JQFMDB *fmdb = [[JQFMDB alloc]initWithDBName:dbName path:[self createDir]];
    BOOL success = [fmdb jq_insertTable:tableName dicOrModel:parameters];
    return success;
}

- (NSArray *)insertTable:(NSString *)tableName inDataBase:(NSString *)dbName modelArray:(nonnull NSArray *)modelArray
{
    DBNAME
    JQFMDB *fmdb = [[JQFMDB alloc]initWithDBName:dbName path:[self createDir]];
    NSArray *arr = [fmdb jq_insertTable:tableName dicOrModelArray:modelArray];
    return arr;
}

- (NSInteger)lastInsertPrimaryKeyIDTableName:(NSString *)tableName inDataBase:(NSString *)dbName 
{
    DBNAME
    JQFMDB *fmdb = [[JQFMDB alloc]initWithDBName:dbName path:[self createDir]];
   return [fmdb lastInsertPrimaryKeyId:tableName];
}

- (NSInteger)totalCountTableName:(NSString *)tableName InDataBase:(NSString *)dbName
{
    DBNAME
    JQFMDB *fmdb = [[JQFMDB alloc]initWithDBName:dbName path:[self createDir]];
    return [fmdb jq_tableItemCount:tableName];
}

- (BOOL)deleteTable:(NSString *)tableName inDataBase:(NSString *)dbName whereFormat:(NSString *)format
{
    DBNAME
    JQFMDB *fmdb = [[JQFMDB alloc]initWithDBName:dbName path:[self createDir]];
    return [fmdb jq_deleteTable:tableName whereFormat:format];
}

- (BOOL)deleteTable:(NSString *)tableName inDataBase:(NSString *)dbName
{
    DBNAME
    JQFMDB *fmdb = [[JQFMDB alloc]initWithDBName:dbName path:[self createDir]];
    return [fmdb jq_deleteTable:tableName];
}

- (NSArray *)lookUpTable:(NSString *)tableName inDataBase:(NSString *)dbName model:(Class)cls whereFormat:(NSString *)format
{
    DBNAME
    JQFMDB *fmdb = [[JQFMDB alloc]initWithDBName:dbName path:[self createDir]];
   return [fmdb jq_lookupTable:tableName dicOrModel:[cls new] whereFormat:format];
}

- (BOOL)modifyTable:(NSString *)tableName inDataBase:(NSString *)dbName model:(id)model whereFormat:(NSString *)format
{
    DBNAME
    JQFMDB *fmdb = [[JQFMDB alloc]initWithDBName:dbName path:[self createDir]];
    BOOL flag = [fmdb jq_updateTable:tableName dicOrModel:model whereFormat:format];
    return flag;
}

- (BOOL)alterTable:(NSString *)tableName inDataBase:(NSString *)dbName model:(Class)cls excludeName:(NSArray *)nameArr
{
        DBNAME
        JQFMDB *fmdb = [[JQFMDB alloc]initWithDBName:dbName path:[self createDir]];
        return [fmdb jq_alterTable:tableName dicOrModel:[cls new] excludeName:nameArr];
}

- (NSArray *)allDBNames
{
    NSArray *array = [NSArray array];
    NSString *filePath = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)lastObject] stringByAppendingString:@"/EasySale"];
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSError *error = nil;
    array = [fileManager contentsOfDirectoryAtPath:filePath error:&error];
    if (error) {
        return nil;
    }
    return array;
}

- (NSArray*)acquireTenModelsBeforeModel:(id)model tableName:(NSString *)tableName inDataBase:(NSString *)dbName
{
    DBNAME
    JQFMDB *fmdb = [[JQFMDB alloc]initWithDBName:dbName path:[self createDir]];
    NSArray *array = [fmdb jq_lookupTable:tableName dicOrModel:model whereFormat:[NSString stringWithFormat:@"where pkid < %@",[model valueForKey:@"pkid"]]];
    if (array.count >=10 ) {
        NSMutableArray *result = [NSMutableArray array];
        for (NSInteger i = array.count - 1 - 10;i < array.count - 1;i++) {
            [result addObject:array[i]];
        }
        return result;
    }else{
        return array;
    }
    
}

- (BOOL)deleteDataBase:(NSString *)dbName
{
    NSString *filePath = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)lastObject] stringByAppendingString:@"/EasySale"];
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSString *sqliteName = nil;
    if (![dbName hasSuffix:@".sqlite"]) {
        sqliteName = [dbName stringByAppendingString:@".sqlite"];
    }
    NSString *file = [NSString stringWithFormat:@"%@/%@",filePath,sqliteName];
    
    NSError *error = nil;
    [fileManager removeItemAtPath:file error:&error];
    if (error) {
        return NO;
    }
    return YES;
}


#pragma mark --Private
///创建文件夹
- (NSString *)createDir{
    
    NSString * docsdir = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    NSString *dataFilePath = [docsdir stringByAppendingPathComponent:@"EasySale"]; // 在Document目录下创建 "EasySale" 文件夹
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    
    BOOL isDir = NO;
    
    // fileExistsAtPath 判断一个文件或目录是否有效，isDirectory判断是否一个目录
    BOOL existed = [fileManager fileExistsAtPath:dataFilePath isDirectory:&isDir];
    
    if (!(isDir && existed)) {
        // 在Document目录下创建一个EasySale目录
        [fileManager createDirectoryAtPath:dataFilePath withIntermediateDirectories:YES attributes:nil error:nil];
    }
    return dataFilePath;
}

///是否存在数据库
- (BOOL)isExistDataBase:(NSString *)dbName
{
    DBNAME
    return [[self allDBNames] containsObject:dbName];
}

///是否存在表
- (BOOL)isExistTable:(NSString *)tableName inDataBase:(NSString *)dbName
{
    DBNAME
    JQFMDB *fmdb = [[JQFMDB alloc]initWithDBName:dbName path:[self createDir]];
    return [fmdb jq_isExistTable:tableName];
}

@end
