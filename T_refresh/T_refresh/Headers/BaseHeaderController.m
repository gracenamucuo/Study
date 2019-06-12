//
//  BaseHeaderController.m
//  T_refresh
//
//  Created by dyp on 2019/6/12.
//  Copyright © 2019 dyp. All rights reserved.
//

#import "BaseHeaderController.h"
#import <Masonry.h>

@interface BaseHeaderController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,assign)NSInteger dataCount;
@end

@implementation BaseHeaderController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationController.navigationBar.barTintColor = [UIColor whiteColor];
    self.navigationController.navigationBar.translucent = NO;
    [self configUI];
}

- (void)configUI
{
    UITableView *tableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
    [self.view addSubview:tableView];
    self.tableView = tableView;
    
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.mas_safeAreaLayoutGuideTop);
        make.left.right.equalTo(self.view);
        make.bottom.equalTo(self.view.mas_safeAreaLayoutGuideBottom);
    }];
    
    
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cellID"];
    self.dataCount = 10;
    self.tableView.backgroundColor = [UIColor blueColor];
    
    [self configHeader];
}

- (void)configHeader
{
 
    WeakSelf
    self.tableView.mj_header = [MJRefreshHeader headerWithRefreshingBlock:^{
        [weakSelf refreshAction];
    }];
    self.tableView.mj_header.ignoredScrollViewContentInsetTop = 40;
    self.tableView.mj_header.backgroundColor = [UIColor redColor];
}

- (void)refreshAction
{
    self.dataCount = (arc4random() % 10) + 10;
    [self.tableView reloadData];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.tableView.mj_header endRefreshing];
    });
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataCount;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellID" forIndexPath:indexPath];
    cell.textLabel.text = [NSString stringWithFormat:@"随机%@",@(indexPath.row)];
    return cell;
}

- (void)dealloc
{
//    NSLog(@"%@ ------销毁",[self class]);
}
@end
