//
//  CustomRefreshHeader.h
//  T_refresh
//
//  Created by dyp on 2019/6/12.
//  Copyright © 2019 dyp. All rights reserved.
//

#import "MJRefreshHeader.h"

@protocol CustomRefreshHeaderDelegate <NSObject>

- (void)refreshState:(MJRefreshState)state;

- (void)refreshHeaderPulling:(CGFloat)pullPercent;

@end

NS_ASSUME_NONNULL_BEGIN

@interface BaseCustomRefreshHeader : MJRefreshHeader

@property (nonatomic,weak)UIView <CustomRefreshHeaderDelegate> *refreshHeader;

@end

NS_ASSUME_NONNULL_END
