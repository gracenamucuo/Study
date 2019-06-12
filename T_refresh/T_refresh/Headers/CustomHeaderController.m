//
//  CustomHeaderController.m
//  T_refresh
//
//  Created by dyp on 2019/6/12.
//  Copyright © 2019 dyp. All rights reserved.
//

#import "CustomHeaderController.h"
#import "CustomHeader.h"
#import "BaseCustomRefreshHeader.h"
@interface CustomHeaderController ()

@end

@implementation CustomHeaderController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)configHeader
{
    WeakSelf
    
    BaseCustomRefreshHeader *refrehHeader = [BaseCustomRefreshHeader headerWithRefreshingBlock:^{
        [weakSelf refreshAction];
    }];
    CustomHeader *header = [[CustomHeader alloc]initWithFrame:CGRectZero];
    refrehHeader.refreshHeader = header;
    [refrehHeader placeSubviews];
    self.tableView.mj_header = refrehHeader;

    self.tableView.mj_header.backgroundColor = [UIColor redColor];
}
@end
