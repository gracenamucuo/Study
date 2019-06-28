//
//  UITableView+Refresh.m
//  T_refresh
//
//  Created by dyp on 2019/6/12.
//  Copyright © 2019 dyp. All rights reserved.
//

#import "UITableView+Refresh.h"
#import "BaseCustomRefreshHeader.h"
#define WeakSelf __weak typeof(self) weakSelf = self;
@implementation UITableView (Refresh)

- (void)setPageCount:(NSNumber *)pageCount
{
    objc_setAssociatedObject(self, @selector(setPageCount:), pageCount, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSNumber *)pageCount
{
    return objc_getAssociatedObject(self, @selector(setPageCount:));
}

- (void)setFooterConfigBlock:(void (^)(NSInteger))footerConfigBlock
{
    objc_setAssociatedObject(self, @selector(setFooterConfigBlock:), footerConfigBlock, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (void (^)(NSInteger))footerConfigBlock
{
    return objc_getAssociatedObject(self, @selector(setFooterConfigBlock:));
}

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
    BaseCustomRefreshHeader *base = [BaseCustomRefreshHeader headerWithRefreshingBlock:^{
        block();
    }];
    base.refreshHeader = customView;
    self.mj_header = base;
    self.mj_header.mj_h = customView.frame.size.height > 0 ? customView.frame.size.height : MJRefreshHeaderHeight;
}

#pragma mark -- footer
- (void)backNormalFooterRefreshingActionBlock:(void (^)(void))block
{
//    WeakSelf
    self.footerConfigBlock = ^(NSInteger newCount) {
        
    };
    self.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
        block();
    }];
    
}

- (void)backGifFooterImages:(NSArray *)images refreshingActionBlock:(void (^)(void))block
{
    self.mj_footer = [MJRefreshBackGifFooter footerWithRefreshingBlock:^{
        block();
    }];
}

- (void)autoNormalFooterRefreshingActionBlock:(void (^)(void))block
{
    self.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
        block();
    }];
}

- (void)autoGifFooterImages:(NSArray *)images refreshingActionBlock:(void (^)(void))block
{
    self.mj_footer = [MJRefreshAutoGifFooter footerWithRefreshingBlock:^{
        block();
    }];
}



- (void)test_normalHeaderRefreshingActionBlock:(RefreshActionBlock)refreshBlock
{
    self.pageCount = [self.pageCount integerValue] > 0 ? self.pageCount : @(20);
    WeakSelf
    self.footerConfigBlock = ^(NSInteger newCount) {
        [weakSelf handleFooter:newCount];
    };
    self.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        refreshBlock(weakSelf.footerConfigBlock);
    }];
}

- (void)test_backNormalFooterRefreshingActionBlock:(RefreshActionBlock)footerRefreshBlock
{
    self.pageCount = [self.pageCount integerValue] > 0 ? self.pageCount : @(20);
    WeakSelf
    self.footerConfigBlock = ^(NSInteger newCount) {
        [weakSelf handleFooter:newCount];
    };
    
    self.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
        footerRefreshBlock(weakSelf.footerConfigBlock);
    }];
}

- (void)handleFooter:(NSInteger)count
{
    if (self.mj_header.isRefreshing) {
        [self.mj_header endRefreshing];
        [self.mj_footer endRefreshing];
    }
    
//    if (!self.mj_footer.isRefreshing) {
//        return;
//    }
    
    if (count < [self.pageCount integerValue]) {
        [self.mj_footer endRefreshingWithNoMoreData];
    }else{
        [self.mj_footer endRefreshing];
    }
}

- (void)beginRefreshing
{
    if (!self.mj_header) return;
    
    [self.mj_header beginRefreshing];
}

- (void)endRefrehing
{
    if (self.mj_header) {
        [self.mj_header endRefreshing];
    }
    if (self.mj_footer) {
        [self.mj_footer endRefreshing];
    }
}
@end
