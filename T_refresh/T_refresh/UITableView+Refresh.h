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

typedef void(^FooterConfigBlock)(NSInteger newDataCount);
typedef void(^RefreshActionBlock)(FooterConfigBlock footerConfig);

@interface UITableView (Refresh)

@property (nonatomic,strong)NSNumber *pageCount;
@property (nonatomic,copy)void(^footerConfigBlock)(NSInteger newCount);

/**header*/
- (void)normalHeaderRefreshingActionBlock:(void(^)(void))block;
- (void)gifHeaderImages:(NSArray *)images refreshingActionBlock:(void(^)(void))block;
- (void)customHeader:(UIView <CustomRefreshHeaderDelegate> *)customView refreshingActionBlock:(void(^)(void))block;
/**footer*/
- (void)backNormalFooterRefreshingActionBlock:(void(^)(void))block;
- (void)backGifFooterImages:(NSArray *)images refreshingActionBlock:(void(^)(void))block;
- (void)autoNormalFooterRefreshingActionBlock:(void(^)(void))block;
- (void)autoGifFooterImages:(NSArray *)images refreshingActionBlock:(void(^)(void))block;

/**--------------------------------------------------*/
- (void)test_normalHeaderRefreshingActionBlock:(RefreshActionBlock)refreshBlock;
- (void)test_backNormalFooterRefreshingActionBlock:(RefreshActionBlock)footerRefreshBlock;

- (void)beginRefreshing;
- (void)endRefrehing;
@end

NS_ASSUME_NONNULL_END
