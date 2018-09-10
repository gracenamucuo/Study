//
//  ViewController.m
//  FMDB_Demo
//
//  Created by 戴运鹏 on 2018/9/10.
//  Copyright © 2018年 戴运鹏. All rights reserved.
//

#import "ViewController.h"
#import "TestListController.h"
#import <FMDatabase.h>
#import "Message.h"
#import "JQFMDB.h"
#define PATH [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject]

@interface ViewController ()
@property (nonatomic,strong)FMDatabase *db;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    [self opetateDataBase];
    [self test];
}

- (void)test
{
    JQFMDB *db = [JQFMDB shareDatabase:@"messages_1.sqlite" path:PATH];
    [db jq_createTable:@"msg1" dicOrModel:[Message class]];
    
    NSMutableArray *msgs = [NSMutableArray array];
    for (NSInteger i = 0; i < 10; i++) {
        Message *msg = [[Message alloc]init];
        msg.info = [NSString stringWithFormat:@"信息第%ld",(long)i];
        if (i % 2 == 0) {
            msg.direction = @"我是左边";
        }else{
            msg.direction = @"我是右边";
        }
        [msgs addObject:msg];
    }
    [db jq_insertTable:@"msg1" dicOrModelArray:msgs];
    
    NSInteger count = [db jq_tableItemCount:@"msg1"];
    if (count > 10) {
        NSArray *array = [db jq_lookupTable:@"msg1" dicOrModel:[Message class] whereFormat:@"where direction = '我是左边'"];
        
        NSLog(@"%@",array);
    }
}

- (void)opetateDataBase
{
    NSString *path = [NSString stringWithFormat:@"%@/messages.sqlite",PATH];
    
    //创建数据库
    self.db = [FMDatabase databaseWithPath:path];
    //大开
    if (![self.db open]) {
        NSLog(@"打开失败");
    }
    //创建表
    BOOL result = [self.db executeUpdate:@"CREATE TABLE IF NOT EXISTS message (id integer PRIMARY KEY AUTOINCREMENT,info text NOT NULL,direction text NOT NULL);"];
    if (result) {
        NSLog(@"创建表成功");
    }
    
    //添加数据
    for (NSInteger i = 0; i < 10; i++) {
        Message *msg = [[Message alloc]init];
        msg.info = [NSString stringWithFormat:@"信息%ld",(long)i];
        if (i % 2 == 0) {
            msg.direction = @"left";
        }else{
            msg.direction = @"right";
        }
       BOOL result = [self.db executeUpdate:@"INSERT INTO message (info,direction) VALUES (?,?)",msg.info,msg.direction];
        if (result) {
            NSLog(@"插入成功");
        }else{
            NSLog(@"插入失败");
        }
        
        
    }
    
}

- (IBAction)pushAction:(UIButton *)sender {
    TestListController *test = [[TestListController alloc]init];
    [self.navigationController pushViewController:test animated:YES];
}




@end















