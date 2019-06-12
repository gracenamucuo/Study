//
//  NormalHeaderController.m
//  T_refresh
//
//  Created by dyp on 2019/6/12.
//  Copyright © 2019 dyp. All rights reserved.
//

#import "NormalHeaderController.h"

@interface NormalHeaderController ()

@end

@implementation NormalHeaderController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)configHeader
{
    WeakSelf
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [weakSelf refreshAction];
    }];
    self.tableView.mj_header.backgroundColor = [UIColor redColor];
}
@end
