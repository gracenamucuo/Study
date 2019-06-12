//
//  UITableView+Refresh.h
//  T_refresh
//
//  Created by dyp on 2019/6/12.
//  Copyright © 2019 dyp. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MJRefresh.h"
#import "BaseCustomRefreshHeader.h"
NS_ASSUME_NONNULL_BEGIN

@interface UITableView (Refresh)

- (void)normalHeaderRefreshingActionBlock:(void(^)(void))block;
- (void)gifHeaderImages:(NSArray *)images refreshingActionBlock:(void(^)(void))block;
- (void)customHeader:(UIView <CustomRefreshHeaderDelegate> *)customView refreshingActionBlock:(void(^)(void))block;

@end

NS_ASSUME_NONNULL_END
