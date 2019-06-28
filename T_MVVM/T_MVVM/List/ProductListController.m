//
//  ProductListController.m
//  T_MVVM
//
//  Created by dyp on 2019/6/25.
//  Copyright © 2019 dyp. All rights reserved.
//

#import "ProductListController.h"
#import "ProductListViewModel.h"
#import "UITableView+Refresh.h"
#import <KVOController.h>
#import <Masonry.h>
#import "ProductCell.h"
@interface ProductListController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (nonatomic,strong)ProductListViewModel *viewModel;
@property (nonatomic,strong)FBKVOController *kvoController;
@end

@implementation ProductListController

- (void)dealloc
{
    NSLog(@"%@ ------销毁",[self class]);
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configUI];
    [self cofigViewModel];
}

- (void)configUI
{

    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([ProductCell class]) bundle:nil] forCellReuseIdentifier:@"cellID"];
    self.tableView.rowHeight = 60.f;
    
}

- (void)cofigViewModel
{
    self.viewModel = [[ProductListViewModel alloc]init];
    self.viewModel.allowRefresh = YES;
    self.viewModel.page = 1;
    self.KVOController = [FBKVOController controllerWithObserver:self];
    [self.KVOController observe:self.viewModel keyPath:@"loaded" options:NSKeyValueObservingOptionNew block:^(id  _Nullable observer, id  _Nonnull object, NSDictionary<NSString *,id> * _Nonnull change) {
        if ([object isEqual:self.viewModel]) {
           BOOL loaded = [change[NSKeyValueChangeNewKey] boolValue];
            if (loaded) {
                [self.tableView reloadData];
                [self.tableView endRefrehing];
            }
        }
    }];
    __weak typeof(self)weakSelf = self;
    if (self.viewModel.allowRefresh) {
        [self.tableView test_normalHeaderRefreshingActionBlock:^(FooterConfigBlock  _Nonnull footerConfig) {
            [weakSelf.viewModel refresh];
        }];
        [self.tableView test_backNormalFooterRefreshingActionBlock:^(FooterConfigBlock  _Nonnull footerConfig) {
            [weakSelf.viewModel loadMore];
        }];
        [self.viewModel refresh];
    }
    
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.viewModel.dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ProductCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellID" forIndexPath:indexPath];
    [cell bindViewModel:self.viewModel.dataSource[indexPath.row]];
    return cell;
}
@end
