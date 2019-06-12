//
//  BaseHeaderController.h
//  T_refresh
//
//  Created by dyp on 2019/6/12.
//  Copyright © 2019 dyp. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MJRefresh.h"
#define WeakSelf __weak typeof(self) weakSelf = self;
NS_ASSUME_NONNULL_BEGIN
@interface BaseHeaderController : UIViewController
@property (nonatomic,weak)UITableView *tableView;
- (void)configHeader;
- (void)refreshAction;
@end

NS_ASSUME_NONNULL_END
