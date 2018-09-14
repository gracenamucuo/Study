//
//  ETIMSessionTableViewDataSource.m
//  IM_Demo
//
//  Created by 戴运鹏 on 2018/9/13.
//  Copyright © 2018年 戴运鹏. All rights reserved.
//

#import "ETIMSessionTableViewDataSource.h"
#import "CellFactory.h"
#import "ETIMMsgModel.h"
@interface ETIMSessionTableViewDataSource()<UITableViewDataSource>
@property (nonatomic,weak)UITableView *tableView;
@property (nonatomic,strong)NSMutableArray *dataArray;
@property (nonatomic,strong)CellFactory *cellFactory;
@property (nonatomic,strong)NSTimer *timer;
@end

@implementation ETIMSessionTableViewDataSource
- (instancetype)initWithTableView:(UITableView *)table
{
    if (self = [super init]) {
        _tableView = table;
        [self initModels];
    }
    return self;
}

- (void)initModels
{

    self.cellFactory = [[CellFactory alloc]init];
    self.tableView.dataSource = self;
    [self.tableView reloadData];
    
    self.timer = [NSTimer timerWithTimeInterval:5 target:self selector:@selector(repeatAddModels) userInfo:nil repeats:YES];
     [self.timer fire];
    [[NSRunLoop mainRunLoop]addTimer:self.timer forMode:NSRunLoopCommonModes];
   
}

- (void)repeatAddModels
{
    ETIMMsgModel *leftModel = [[ETIMMsgModel alloc]initWithType:@"left" message:@"啊啊啊ggg"];
    [self.dataArray addObject:leftModel];
    ETIMMsgModel *rightModel = [[ETIMMsgModel alloc]initWithType:@"right" message:@"hhhhhh啊啊bbbbbb"];
    [self.dataArray addObject:rightModel];
    [self.tableView reloadData];
    if ([self.dataArray count] > 0) {
        [self.tableView scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:[self.dataArray count]-1 inSection:0] atScrollPosition:UITableViewScrollPositionNone animated:YES];
    }
}

- (NSInteger)totalCount
{
    return self.dataArray.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell;
    ETIMMsgModel *model = self.dataArray[indexPath.row];
    cell = [self.cellFactory cellInTable:tableView model:model];
    return cell;
}

- (NSMutableArray *)dataArray
{
    if (!_dataArray) {
        _dataArray = [NSMutableArray array];
        ETIMMsgModel *leftModel = [[ETIMMsgModel alloc]initWithType:@"left" message:@"啊啊啊"];
        [_dataArray addObject:leftModel];
        ETIMMsgModel *rightModel = [[ETIMMsgModel alloc]initWithType:@"right" message:@"hhhhhh啊啊"];
        [_dataArray addObject:rightModel];
    }
    return _dataArray;
}

@end
