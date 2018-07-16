//
//  NormalHeaderController.m
//  Refresh_Demo
//
//  Created by 戴运鹏 on 2018/7/16.
//  Copyright © 2018年 戴运鹏. All rights reserved.
//

#import "NormalHeaderController.h"
#import "MJRefresh.h"
@interface NormalHeaderController ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic,strong)UITableView *tableView;
@property (nonatomic,strong)NSMutableArray *dataArray;

@end
static NSString *cellID = @"cellID";
@implementation NormalHeaderController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self layoutUI];
}
- (void)layoutUI
{
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 64, self.view.frame.size.width, self.view.frame.size.height - 64) style:UITableViewStylePlain];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:cellID];
    MJRefreshNormalHeader *refreshHeader = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(refreshAction)];
    refreshHeader.backgroundColor = [UIColor redColor];
    self.tableView.mj_header = refreshHeader;
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.tableView];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
}
#pragma mark -- header
- (void)refreshAction
{
}
#pragma mark --Delegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID forIndexPath:indexPath];
    cell.textLabel.text = @"NormalHeaderController";
    return cell;
}



@end
