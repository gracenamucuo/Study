//
//  UITableView+Refresh.m
//  T_refresh
//
//  Created by dyp on 2019/6/12.
//  Copyright © 2019 dyp. All rights reserved.
//

#import "UITableView+Refresh.h"
#import "BaseCustomRefreshHeader.h"
@implementation UITableView (Refresh)

- (void)normalHeaderRefreshingActionBlock:(void (^)(void))block
{
    self.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        block();
    }];
}

- (void)gifHeaderImages:(NSArray *)images refreshingActionBlock:(void (^)(void))block
{
    if (images.count == 0 || !images) {
        self.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
            block();
        }];
        return;
    }
    
    self.mj_header = [MJRefreshGifHeader headerWithRefreshingBlock:^{
        block();
    }];
}

- (void)customHeader:(UIView<CustomRefreshHeaderDelegate> *)customView refreshingActionBlock:(void (^)(void))block
{
    self.mj_header = [BaseCustomRefreshHeader headerWithRefreshingBlock:^{
        block();
    }];
    self.mj_header.mj_h = customView.frame.size.height > 0 ? customView.frame.size.height : MJRefreshHeaderHeight;
    
}

@end
