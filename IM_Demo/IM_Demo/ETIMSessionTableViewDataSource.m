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
    
//    self.timer = [NSTimer timerWithTimeInterval:5 target:self selector:@selector(repeatAddModels) userInfo:nil repeats:YES];
//     [self.timer fire];
//    [[NSRunLoop mainRunLoop]addTimer:self.timer forMode:NSRunLoopCommonModes];
    if ([self.dataArray count] > 0) {
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                 [self.tableView scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:[self.dataArray count]-1 inSection:0] atScrollPosition:UITableViewScrollPositionNone animated:YES];
        });
   
    }
}

- (void)repeatAddModels
{
//    ETIMMsgModel *leftModel = [[ETIMMsgModel alloc]initWithType:@"left" message:@"啊啊啊ggg"];
//    [self.dataArray addObject:leftModel];
//    ETIMMsgModel *rightModel = [[ETIMMsgModel alloc]initWithType:@"right" message:@"hhhhhh啊啊bbbbbb"];
//    [self.dataArray addObject:rightModel];
//    [self.tableView reloadData];
//    if ([self.dataArray count] > 0) {
//        [self.tableView scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:[self.dataArray count]-1 inSection:0] atScrollPosition:UITableViewScrollPositionNone animated:YES];
//    }
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
        
        
        for (NSInteger i = 0; i < 15; i++) {
            NSString *str = [NSString stringWithFormat:@"实时 %ld",(long)i];
            ETIMMsgModel *leftModel = [[ETIMMsgModel alloc]initWithType:@"left" message:str];
            [_dataArray addObject:leftModel];
            ETIMMsgModel *rightModel = [[ETIMMsgModel alloc]initWithType:@"right" message:str];
            [_dataArray addObject:rightModel];
        }
    }
    return _dataArray;
}

- (void)addNewMessage:(NSString *)msg
{
    ETIMMsgModel *leftModel = [[ETIMMsgModel alloc]initWithType:msg.length > 10?@"left":@"right" message:msg];
    [self.dataArray addObject:leftModel];
    [self.tableView reloadData];
    if ([self.dataArray count] > 0) {
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [self.tableView scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:[self.dataArray count]-1 inSection:0] atScrollPosition:UITableViewScrollPositionNone animated:YES];
        });
        
    }
}

@end
