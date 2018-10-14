//
//  FMDBController.m
//  TestDB
//
//  Created by 戴运鹏 on 2018/10/13.
//  Copyright © 2018年 戴运鹏. All rights reserved.
//

#import "FMDBController.h"
#import "FileHelper.h"
#import <FMDB.h>
#import "MsgModel.h"
#import "XMGModelTool.h"
#import "XMGSqliteModelTool.h"
#import "XMGSqliteTool.h"
#import "XMGTableTool.h"
#import "DataBaseHelper.h"
@interface FMDBController ()
@property (nonatomic,strong)FMDatabase *db;
@property (nonatomic,strong)DataBaseHelper *dbHelper;
@property (nonatomic,strong)DataBaseHelper *dbHelper1;
@end

@implementation FMDBController

- (void)viewDidLoad {
    [super viewDidLoad];
    DataBaseHelper *dbHelper = [[DataBaseHelper alloc]init];
    self.dbHelper = dbHelper;
    [self.dbHelper createTableWithName:@"table_msg"];
    
    DataBaseHelper *db = [[DataBaseHelper alloc]init];
    self.dbHelper1 = db;
    [self.dbHelper1 createTableWithName:@"table2"];
    
    
    NSOperationQueue *queue = [[NSOperationQueue alloc]init];
    queue.maxConcurrentOperationCount = 3;
    NSInvocationOperation *op1 = [[NSInvocationOperation alloc]initWithTarget:self selector:@selector(insertOperation1) object:nil];
    NSInvocationOperation *op2 = [[NSInvocationOperation alloc]initWithTarget:self selector:@selector(readOperation1) object:nil];
    
    NSInvocationOperation *op3 = [[NSInvocationOperation alloc]initWithTarget:self selector:@selector(insertOperation2) object:nil];
    NSInvocationOperation *op4 = [[NSInvocationOperation alloc]initWithTarget:self selector:@selector(readOperation2) object:nil];
    [op2 addDependency:op1];
    [op4 addDependency:op3];
    
    [queue addOperation:op1];
    [queue addOperation:op2];
    [queue addOperation:op3];
    [queue addOperation:op4];
}

- (void)insertOperation1
{
    NSMutableArray *arr = [NSMutableArray array];
    for (NSInteger i = 0; i < 10; i++) {
        NSString *content = [NSString stringWithFormat:@"多插%ld",(long)i];
        MsgModel *msg = [[MsgModel alloc]initWithContent:content height:12+i];
        [arr addObject:msg];
    }
    NSArray *indexArr = [self.dbHelper insertMessages:arr inTableName:@"table_msg"];
    if (indexArr.count <= 0) {
        NSLog(@"多插成功");
    }
    NSLog(@"插入1%@",[NSThread currentThread]);
}
- (void)insertOperation2
{
    NSMutableArray *arr = [NSMutableArray array];
    for (NSInteger i = 0; i < 10; i++) {
        NSString *content = [NSString stringWithFormat:@"多插%ld",(long)i];
        MsgModel *msg = [[MsgModel alloc]initWithContent:content height:12+i];
        [arr addObject:msg];
    }
    NSArray *indexArr = [self.dbHelper1 insertMessages:arr inTableName:@"table2"];
    if (indexArr.count <= 0) {
        NSLog(@"多插成功");
    }
    NSLog(@"插入2%@",[NSThread currentThread]);
    
}
- (void)readOperation1
{
    NSLog(@"读取%@",[NSThread currentThread]);
    NSArray *result1 = [self.dbHelper lookUpAllDataWithTable:@"table_msg" completion:^(NSArray * _Nonnull arr) {
        NSLog(@"%@",arr);
    }];
    
}

- (void)readOperation2
{
    NSLog(@"读取%@",[NSThread currentThread]);
    NSArray *result2 = [self.dbHelper1 lookUpAllDataWithTable:@"table2" completion:^(NSArray * _Nonnull arr) {
        NSLog(@"%@",arr);
    }];
    
}
#pragma mark -建数据库
- (void)createDataBase
{
    NSString *dbPath = [FileHelper dirPathInLibraryNamed:@"message.sqlite"];
    FMDatabase *db = [FMDatabase databaseWithPath:dbPath];
    self.db = db;
    if ([db open]) {
        NSLog(@"建立数据库成功");
    }
    
}

#pragma mark -- 建表
- (void)createTable
{
    
    NSDictionary *dic1 = [XMGModelTool getModelIvarNameSqlTypeDic:[MsgModel class]];
    NSString *primary = @"pkid";
    NSMutableDictionary *dic = [NSMutableDictionary dictionaryWithDictionary:dic1];
    [dic removeObjectForKey:primary];
    NSMutableArray *sqlArr = [NSMutableArray array];
    [dic enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
        [sqlArr addObject:[NSString stringWithFormat:@"%@ %@",key,obj]];
        
    }];
    
  
    
    NSString *createSql = [NSString stringWithFormat:@"create table if not exists %@(%@,%@ %@ PRIMARY KEY AUTOINCREMENT)",@"table_msg",[sqlArr componentsJoinedByString:@","],primary,@"integer"];
    
    [self.db executeUpdate:createSql];
    
    MsgModel *msg = [[MsgModel alloc]initWithContent:@"第条" height:50];
    
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
    NSString *insertSql = [NSString stringWithFormat:@"insert into %@ (%@) values (%@)",@"table_msg",[cloumn componentsJoinedByString:@","],[values componentsJoinedByString:@","]];
//    [self.db executeUpdate:@"insert into %@ (%@) values",tableName,[columnNames componentsJoinedByString:@","]];
//    [self.db executeQuery:insertSql withArgumentsInArray:values];
    [self.db executeUpdate:insertSql];
    [self.db executeUpdate:@"ALTER TABLE table_msg ADD COLUMN sex Text"];
    [self.db close];
    
}
@end










