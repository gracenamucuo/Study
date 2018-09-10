//
//  TestListController.m
//  FMDB_Demo
//
//  Created by 戴运鹏 on 2018/9/10.
//  Copyright © 2018年 戴运鹏. All rights reserved.
//

#import "TestListController.h"
#import <FMDatabase.h>
#define PATH [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject]
@interface TestListController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong)UITableView *tableView;
@property (nonatomic,strong)FMDatabase *db;
@property (nonatomic,strong)NSMutableArray *dataArray;
@end
static NSString *cellID = @"cellID";
@implementation TestListController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self layoutUI];
    NSString *path = [NSString stringWithFormat:@"%@/messages.sqlite",PATH];
    self.db = [FMDatabase databaseWithPath:path];
    [self.db open];
    FMResultSet *result = [self.db executeQuery:@"select * from message"];
    while ([result next]) {
        NSString *info = [result objectForColumn:@"info"];
        NSString *direction = [result objectForColumn:@"direction"];
        NSLog(@"%@   %@",info,direction);
    }
    [self.db close];
}
- (void)layoutUI
{
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStylePlain];
    [self.view addSubview:self.tableView];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:cellID];
    
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID forIndexPath:indexPath];
    return cell;
}

- (NSMutableArray *)dataArray
{
    if (!_dataArray) {
        _dataArray = [NSMutableArray array];
    }
    return _dataArray;
}

@end
