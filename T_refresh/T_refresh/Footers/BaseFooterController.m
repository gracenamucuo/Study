//
//  BaseFooterController.m
//  T_refresh
//
//  Created by dyp on 2019/6/13.
//  Copyright © 2019 dyp. All rights reserved.
//

#import "BaseFooterController.h"
#import <Masonry.h>
#import "UITableView+Refresh.h"
@interface BaseFooterController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,assign)NSInteger dataCount;
@property (nonatomic,assign)NSInteger page;
@end

@implementation BaseFooterController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.page = 1;
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
    self.tableView.tableFooterView = [UIView new];
    
    [self configFooter];
}

- (void)configFooter
{
    self.tableView.pageCount = @(10);
    WeakSelf
    [self.tableView test_normalHeaderRefreshingActionBlock:^(FooterConfigBlock  _Nonnull footerConfig) {
        weakSelf.page = 1;
        [weakSelf requestData:^(NSInteger count) {
            weakSelf.dataCount = count;
            [weakSelf.tableView reloadData];
            footerConfig(count);
        } failCallBack:^{
            [weakSelf.tableView endRefrehing];
        }];
    }];

    [self.tableView test_backNormalFooterRefreshingActionBlock:^(FooterConfigBlock  _Nonnull footerConfig) {
        [weakSelf requestData:^(NSInteger count) {
            weakSelf.dataCount += count;
            [weakSelf.tableView reloadData];
            footerConfig(count);
        } failCallBack:^{
            [weakSelf.tableView endRefrehing];
        }];
    }];
    
    [self.tableView beginRefreshing];
}

- (void)requestData:(void(^)(NSInteger count))successCallBack failCallBack:(void(^)(void))failCallBack
{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        if (self.page > 5) {
            failCallBack();
        }else{
            successCallBack(10);
        }
        self.page += 1;
    });
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataCount;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellID" forIndexPath:indexPath];
    cell.textLabel.text = [NSString stringWithFormat:@"%@footer",@(indexPath.row)];
    return cell;
}

- (void)dealloc
{
    NSLog(@"%@ ------销毁",[self class]);
}

@end
