//
//  ETIMDataBaseManager.m
//  DataBaseDemo
//
//  Created by 戴运鹏 on 2018/9/19.
//  Copyright © 2018年 戴运鹏. All rights reserved.
//

#import "ETIMDataBaseManager.h"
#import "JQFMDB.h"
//#import "ETEasySaleMessageModel.h"
//#import "ETEasySaleIMHeader.h"
#import "TestModel.h"
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
    [fmdb close];
    [fmdb open];
    BOOL success = [fmdb jq_createTable:tableName dicOrModel:[cls new]];
    [fmdb close];
    return success;
}

- (BOOL)createTable:(NSString *)tableName inDataBase:(NSString *)dbName modelCls:(Class)cls excludeName:(NSArray *)nameArr
{
    DBNAME
    JQFMDB *fmdb = [[JQFMDB alloc]initWithDBName:dbName path:[self createDir]];
    BOOL success = [fmdb jq_createTable:tableName dicOrModel:[cls new] excludeName:nameArr];
    return success;
}

- (void)insertTable:(NSString *)tableName inDataBase:(NSString*)dbName model:(id)parameters completion:(void(^)(BOOL isSuccess))completion
{
    DBNAME
        if ([self isExistTable:tableName inDataBase:dbName]) {
            JQFMDB *fmdb = [[JQFMDB alloc]initWithDBName:dbName path:[self createDir]];
            [fmdb close];
            [fmdb open];
            [fmdb jq_inDatabase:^{
            
               BOOL finished = [fmdb jq_insertTable:tableName dicOrModel:parameters];
                completion(finished);
                [fmdb close];
            }];
          
        }else{
    
            if ([self createTable:tableName inDataBase:dbName modelCls:[parameters class]]) {
                JQFMDB *fmdb = [[JQFMDB alloc]initWithDBName:dbName path:[self createDir]];
                [fmdb close];
                [fmdb open];
                [fmdb jq_inDatabase:^{
                    BOOL finished = [fmdb jq_insertTable:tableName dicOrModel:parameters];
                    completion(finished);
                    [fmdb close];
                }];
            }
        }

}

- (void)insertTable:(NSString *)tableName inDataBase:(NSString *)dbName modelArray:(nonnull NSArray *)modelArray completion:(nonnull void (^)(NSArray * _Nonnull))completion
{
    DBNAME
    if ([self isExistTable:tableName inDataBase:dbName]) {
        JQFMDB *fmdb = [[JQFMDB alloc]initWithDBName:dbName path:[self createDir]];
       
        
        [fmdb jq_inDatabase:^{
            [fmdb close];
            [fmdb open];
            NSArray *arr = [fmdb jq_insertTable:tableName dicOrModelArray:modelArray];
            completion(arr);
             [fmdb close];
        }];
        
        
        
        
    }else{
        if ([self createTable:tableName inDataBase:dbName modelCls:[TestModel class]]) {
            JQFMDB *fmdb = [[JQFMDB alloc]initWithDBName:dbName path:[self createDir]];
            
            [fmdb jq_inDatabase:^{
                [fmdb close];
                [fmdb open];
                NSArray *arr = [fmdb jq_insertTable:tableName dicOrModelArray:modelArray];
                completion(arr);
                 [fmdb close];
            }];
           
            
        }
    }
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

- (void)lookUpTable:(NSString *)tableName inDataBase:(NSString *)dbName model:(Class)cls whereFormat:(NSString *)format completion:(void(^)(NSArray *result))completion
{
    DBNAME
    JQFMDB *fmdb = [[JQFMDB alloc]initWithDBName:dbName path:[self createDir]];
    [fmdb close];
    [fmdb open];
    [fmdb jq_inDatabase:^{
       NSArray *result = [fmdb jq_lookupTable:tableName dicOrModel:[cls new] whereFormat:format];
        completion(result);
        [fmdb close];
    }];
   
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
    NSString *filePath = [[NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES)lastObject] stringByAppendingString:@"/EasySale"];
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSError *error = nil;
    array = [fileManager contentsOfDirectoryAtPath:filePath error:&error];
    if (error) {
        return nil;
    }
    return array;
}

- (void)acquireTenModelsBeforeModel:(id)model tableName:(NSString *)tableName inDataBase:(NSString *)dbName completion:(nonnull void (^)(NSArray * _Nonnull))completion
{
    DBNAME
    
    
    TestModel *msg = (TestModel *)model;
    if ([self isExistTable:tableName inDataBase:dbName]) {
        JQFMDB *fmdb = [[JQFMDB alloc]initWithDBName:dbName path:[self createDir]];
        [fmdb open];
        
        NSArray *arr = [fmdb jq_lookupTable:tableName dicOrModel:model whereFormat:@"where pkid = '1'"];
        if (arr.count > 0) {
            TestModel *result = arr[0];
            if ([result.date isEqualToString:msg.date]) {
                completion(@[]);
                [fmdb close];
                return;
            }
        }
        NSString *last = [NSString stringWithFormat:@"%ld",[self lastInsertPrimaryKeyIDTableName:tableName inDataBase:dbName]];
        
        NSString *midFormat;
        NSString *lastFormat;
        
        NSInteger num = 0;
        NSInteger offset = 0;
        if ([msg.date doubleValue] > 0) {
            [fmdb close];
            [fmdb open];
           NSArray *arr = [fmdb jq_lookupTable:tableName dicOrModel:model whereFormat:[NSString stringWithFormat:@"where date = '%@'",[model valueForKey:@"date"]]];
            TestModel *message = arr[0];
            if (message.pkid > 10) {
                num = 10;
                offset = message.pkid - 10;
            }else{
                num = message.pkid - 1;
                offset = 0;
            }
            midFormat = [NSString stringWithFormat:@"order by date limit %d offset %d",num,offset];
        }else{
            if ([last integerValue] > 10) {
                num = 10;
                offset = [last integerValue] - 10;
            }else{
                num = [last integerValue] - 1;
                offset = 0;
            }
            lastFormat = [NSString stringWithFormat:@"order by date limit %d offset %d",num,offset];//order by date
        }
       
        

        NSString *format = [msg.date doubleValue] > 0?midFormat:lastFormat;
 
        [fmdb jq_inDatabase:^{
            NSArray *array = [fmdb jq_lookupTable:tableName dicOrModel:model whereFormat:format];
            NSLog(@"数据库打印  %@   ",fmdb);
            [fmdb close];
            
            completion(array);
            
                
        }];
    
    }else{
        completion(nil);
        
    }
    

    
}

- (BOOL)deleteDataBase:(NSString *)dbName
{
    NSString *filePath = [[NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES)lastObject] stringByAppendingString:@"/EasySale"];
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
    
    NSString * docsdir = [NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES) lastObject];
    NSString *dataFilePath = [docsdir stringByAppendingPathComponent:@"EasySale"]; // 在Library目录下创建 "EasySale" 文件夹
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
    if ([self isExistDataBase:dbName]) {
        JQFMDB *fmdb = [[JQFMDB alloc]initWithDBName:dbName path:[self createDir]];
        return [fmdb jq_isExistTable:tableName];
    }else{
        return NO;
    }

}

@end
