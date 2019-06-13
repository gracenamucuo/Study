//
//  BaseFooterController.h
//  T_refresh
//
//  Created by dyp on 2019/6/13.
//  Copyright © 2019 dyp. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MJRefresh.h"
#define WeakSelf __weak typeof(self) weakSelf = self;
NS_ASSUME_NONNULL_BEGIN

@interface BaseFooterController : UIViewController
@property (nonatomic,weak)UITableView *tableView;
- (void)configFooter;
- (void)footerRefreshAction;
@end

NS_ASSUME_NONNULL_END
