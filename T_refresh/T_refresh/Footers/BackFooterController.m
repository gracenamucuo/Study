//
//  BackFooterController.m
//  T_refresh
//
//  Created by dyp on 2019/6/13.
//  Copyright © 2019 dyp. All rights reserved.
//

#import "BackFooterController.h"

@interface BackFooterController ()

@end

@implementation BackFooterController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)configFooter
{
    WeakSelf
    self.tableView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
        [weakSelf footerRefreshAction];
    }];
    self.tableView.mj_footer.backgroundColor = [UIColor redColor];
}

@end
