//
//  HeaderController.m
//  Refresh_Demo
//
//  Created by 戴运鹏 on 2018/7/16.
//  Copyright © 2018年 戴运鹏. All rights reserved.
//

#import "HeaderController.h"
#import "MJRefresh.h"
@interface HeaderController ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic,strong)UITableView *tableView;
@property (nonatomic,strong)NSMutableArray *dataArray;
@end
static NSString *cellID = @"cellID";
@implementation HeaderController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self layoutUI];
}
- (void)layoutUI
{
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 64, self.view.frame.size.width, self.view.frame.size.height - 64) style:UITableViewStylePlain];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:cellID];
    MJRefreshHeader *refreshHeader = [MJRefreshHeader headerWithRefreshingTarget:self refreshingAction:@selector(refreshAction)];
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
    /*
     #0    0x00000001006cf41c in -[HeaderController refreshAction] at /Users/daiyunpeng/Desktop/Refresh_Demo/Refresh_Demo/HeaderController.m:37

     
     #1    0x00000001006d2a04 in __47-[MJRefreshComponent executeRefreshingCallback]_block_invoke at /Users/daiyunpeng/Desktop/Refresh_Demo/MJRefresh/MJRefresh/Base/MJRefreshComponent.m:236

     
     #1    0x00000001006d2868 in -[MJRefreshComponent executeRefreshingCallback] at /Users/daiyunpeng/Desktop/Refresh_Demo/MJRefresh/MJRefresh/Base/MJRefreshComponent.m:231

     #2    0x00000001006d45a4 in __28-[MJRefreshHeader setState:]_block_invoke.84 at /Users/daiyunpeng/Desktop/Refresh_Demo/MJRefresh/MJRefresh/Base/MJRefreshHeader.m:138

     
     
     */
}

#pragma mark --Delegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID forIndexPath:indexPath];
    cell.textLabel.text = @"only header";
    return cell;
}

@end
