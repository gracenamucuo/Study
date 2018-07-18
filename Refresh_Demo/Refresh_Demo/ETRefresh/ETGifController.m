//
//  ETGifController.m
//  Refresh_Demo
//
//  Created by 戴运鹏 on 2018/7/18.
//  Copyright © 2018年 戴运鹏. All rights reserved.
//

#import "ETGifController.h"
#import "UITableView+ETRefresh.h"
@interface ETGifController ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic,strong)UITableView *tableView;
@property (nonatomic,assign)NSInteger count;
@end
static NSString *cellID = @"cellID";
@implementation ETGifController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self layoutUI];
}

- (void)layoutUI
{
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 64, self.view.frame.size.width, self.view.frame.size.height - 64) style:UITableViewStylePlain];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:cellID];
    
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.tableView];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    __weak typeof(self) weakSelf = self;
    [self.tableView et_gifHeaderWithRefreshingBlock:^{
        NSLog(@"%@",[weakSelf class]);
    }];
    self.tableView.tableFooterView = [UIView new];
    [self.tableView et_backGifFooterWithRefreshingBlock:^{
        weakSelf.count += 10;
        if (weakSelf.count == 50) {
            [weakSelf.tableView et_noMoreData];
            [weakSelf.tableView reloadData];
            return ;
        }
        [weakSelf.tableView reloadData];
        [weakSelf.tableView et_endRefresh];
    }];
        self.count = 10;
}
#pragma mark --Delegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID forIndexPath:indexPath];
    cell.textLabel.text = @"only header";
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self.tableView et_endRefresh];
}

- (void)dealloc
{
    NSLog(@"%@ 销毁",[self class]);
}
@end
