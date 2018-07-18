//
//  UITableView+ETRefresh.h
//  Refresh_Demo
//
//  Created by 戴运鹏 on 2018/7/18.
//  Copyright © 2018年 戴运鹏. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITableView (ETRefresh)
- (void)et_beginRefreshing;
- (void)et_endRefresh;
- (void)et_noMoreData;
//header
- (void)et_normalHeaderWithRefreshingBlock:(void(^)(void))block;
- (void)et_gifHeaderWithRefreshingBlock:(void(^)(void))block;
//footer back
- (void)et_backNormalFooterWithRefreshingBlock:(void(^)(void))block;
- (void)et_backGifFooterWithRefreshingBlock:(void(^)(void))block;
//footer auto
- (void)et_autoNormalFooterWithRefreshingBlock:(void(^)(void))block;
- (void)et_autoGifFooterWithRefreshingBlock:(void(^)(void))block;
@end
