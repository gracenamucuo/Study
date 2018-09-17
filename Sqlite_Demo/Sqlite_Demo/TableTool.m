//
//  TableTool.m
//  Sqlite_Demo
//
//  Created by 戴运鹏 on 2018/9/16.
//  Copyright © 2018年 戴运鹏. All rights reserved.
//

#import "TableTool.h"
#import "ModelTool.h"
#import "SqliteTool.h"
@implementation TableTool
//获取现有表格里的所有字段，与model的字段进行对比，看表格是否需要更新
+ (NSArray *)tableSortedColumnNamesCls:(Class)cls uid:(NSString *)uid
{
   NSString *tableName = [ModelTool tableName:cls];
    NSString *createSqlStr = [NSString stringWithFormat:@"select sql from sqlite_master where type = 'table' and name = '%@'",tableName];
   NSMutableDictionary *dic = [SqliteTool querySql:createSqlStr user_id:uid].firstObject;
    NSString *createTableSql = [dic[@"sql"] lowercaseString];
    createTableSql = [createTableSql stringByReplacingOccurrencesOfString:@"\"" withString:@""];
     createTableSql = [createTableSql stringByReplacingOccurrencesOfString:@"\n" withString:@""];
     createTableSql = [createTableSql stringByReplacingOccurrencesOfString:@"\t" withString:@""];
    NSLog(@"%@",dic);
    if (createSqlStr.length == 0) {
        return nil;
    }
   NSString *nameTypeStr = [createSqlStr componentsSeparatedByString:@"("][1];
    NSArray *nameTypeArray = [nameTypeStr componentsSeparatedByString:@","];
    NSMutableArray *names = [NSMutableArray array];
    for (NSString *nameType in nameTypeArray) {
        if ([nameType containsString:@"primary"]) {
            continue;
        }
        NSString *nameType2 = [nameType stringByTrimmingCharactersInSet:[NSCharacterSet characterSetWithCharactersInString:@" "]];
        
        NSString *name = [nameType2 componentsSeparatedByString:@" "].firstObject;
        [names addObject:name];
        
    }
    [names sortUsingComparator:^NSComparisonResult(NSString *obj1, NSString * obj2) {
        return [obj1 compare:obj2];
    }];
    return names;
}

@end


























































































































































































