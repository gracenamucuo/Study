//
//  GifHeaderController.m
//  T_refresh
//
//  Created by dyp on 2019/6/12.
//  Copyright © 2019 dyp. All rights reserved.
//

#import "GifHeaderController.h"

@interface GifHeaderController ()

@end

@implementation GifHeaderController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}


- (void)configHeader
{
    WeakSelf
    self.tableView.mj_header = [MJRefreshGifHeader headerWithRefreshingBlock:^{
        [weakSelf refreshAction];
    }];
    self.tableView.mj_header.backgroundColor = [UIColor redColor];
}


@end
