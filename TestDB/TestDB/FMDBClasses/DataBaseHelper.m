//
//  DataBaseHelper.m
//  TestDB
//
//  Created by 戴运鹏 on 2018/10/14.
//  Copyright © 2018年 戴运鹏. All rights reserved.
//

#import "DataBaseHelper.h"
#import <FMDB.h>
#import "FileHelper.h"
#import "XMGModelTool.h"
@interface DataBaseHelper ()
@property (nonatomic,strong)FMDatabase *db;
@property (nonatomic,strong)FMDatabaseQueue *dbqueue;
@end
static NSString *tableName = @"table_msg";
static NSString *primary = @"pkid";
@implementation DataBaseHelper

- (instancetype)init
{
    if ([super init]) {
        NSString *dbPath = [FileHelper dirPathInLibraryNamed:@"message.sqlite"];
        NSLog(@"%@",dbPath);
        FMDatabase *db = [FMDatabase databaseWithPath:dbPath];
        FMDatabaseQueue *queue = [FMDatabaseQueue databaseQueueWithPath:dbPath];
        _db = db;
        _dbqueue = queue;
        if ([_db open]) {
            NSLog(@"建立数据库成功");
            
        }
        
    }
    return self;
}
- (void)createTableWithName:(NSString *)name
{
    
    NSDictionary *dic1 = [XMGModelTool getModelIvarNameSqlTypeDic:[MsgModel class]];
    
    NSMutableDictionary *dic = [NSMutableDictionary dictionaryWithDictionary:dic1];
    [dic removeObjectForKey:primary];
    NSMutableArray *sqlArr = [NSMutableArray array];
    [dic enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
        [sqlArr addObject:[NSString stringWithFormat:@"%@ %@",key,obj]];
        
    }];
    NSString *createSql = [NSString stringWithFormat:@"create table if not exists %@(%@,%@ %@ PRIMARY KEY AUTOINCREMENT)",name,[sqlArr componentsJoinedByString:@","],primary,@"integer"];
    
    [self.db executeUpdate:createSql];
}

- (BOOL)insertMessage:(MsgModel *)msg inTableName:(nonnull NSString *)name
{
    NSString *insertSql = [self insertSqlWithModel:msg inTable:name];
    [self.dbqueue inDatabase:^(FMDatabase * _Nonnull db) {
       [self.db executeUpdate:insertSql];
    }];
   return YES;
}

- (NSArray *)insertMessages:(NSArray *)msgs inTableName:(nonnull NSString *)name
{
    
    for (MsgModel *msg in msgs) {
         NSString *insertSql = [self insertSqlWithModel:msg inTable:name];
        [self.dbqueue inDatabase:^(FMDatabase * _Nonnull db) {
            BOOL success = [self.db executeUpdate:insertSql];
            NSMutableArray *failIndexArr = [NSMutableArray array];
            if (!success) {
                NSInteger index = [msgs indexOfObject:msg];
                [failIndexArr addObject:@(index)];
            }
        }];
    }
    return @[];
}

- (NSArray *)lookUpAllDataWithTable:(NSString *)tableName completion:(nonnull void (^)(NSArray * _Nonnull))completion
{
    [self.dbqueue inDatabase:^(FMDatabase * _Nonnull db) {
        NSString *str = [NSString stringWithFormat:@"select * from  %@",tableName];
        FMResultSet *set = [self.db executeQuery:str];
       completion([self resultWithSet:set]);
    }];
    
    return nil;
}

- (NSInteger)maxPrimaryWithTable:(NSString *)tableName
{
    NSString *sql = [NSString stringWithFormat:@"select max(pkid) from %@",tableName];
    FMResultSet *set = [self.db executeQueryWithFormat:@"SELECT * FROM table_msg where pkid = (select max(pkid) from table_msg)"];
    NSInteger max = -1;
    while ([set next]) {
         max = [set longLongIntForColumn:@"pkid"];
    }
    
    return max;
}

#pragma mark -private
- (NSString *)insertSqlWithModel:(MsgModel *)msg inTable:(NSString*)name
{
    NSArray *columnNames = [XMGModelTool getModelIvarNames:[msg class]];
    NSMutableArray *cloumn = [NSMutableArray arrayWithArray:columnNames];
    [cloumn removeObject:primary];
    NSMutableArray *values = [NSMutableArray array];
    for (NSString *columnName in cloumn) {
        id value = [msg valueForKey:columnName];
        if ([value isKindOfClass:[NSString class]]) {
            value = [NSString stringWithFormat:@"'%@'",value];
        }
        [values addObject:value];
    }
    NSString *insertSql = [NSString stringWithFormat:@"insert into %@ (%@) values (%@)",name,[cloumn componentsJoinedByString:@","],[values componentsJoinedByString:@","]];
    return insertSql;
}

- (NSArray *)resultWithSet:(FMResultSet *)set
{
    NSArray *columnNames = [XMGModelTool getModelIvarNames:[MsgModel class]];
    NSDictionary *types = [XMGModelTool getModelIvarNameSqlTypeDic:[MsgModel class]];
    NSMutableArray *models = [NSMutableArray array];
    while ([set next]) {
        MsgModel *msg = [MsgModel new];
        for (NSString *column in columnNames) {
            if ([types[column] isEqualToString:@"text"]) {
                [msg setValue:[set stringForColumn:column] forKey:column];
            }else if ([types[column] isEqualToString:@"integer"]){
                [msg setValue:@([set longLongIntForColumn:column]) forKey:column];
            }else if ([types[column] isEqualToString:@"real"]){
                [msg setValue:[NSNumber numberWithDouble:[set doubleForColumn:column]] forKey:column];
            }
        }
        [models addObject:msg];
    }
    return models;
}

@end
