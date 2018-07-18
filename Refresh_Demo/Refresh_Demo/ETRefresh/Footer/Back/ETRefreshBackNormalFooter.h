//
//  ETRefreshBackNormalFooter.h
//  Refresh_Demo
//
//  Created by 戴运鹏 on 2018/7/18.
//  Copyright © 2018年 戴运鹏. All rights reserved.
//

#import "MJRefresh.h"

@interface ETRefreshBackNormalFooter : MJRefreshBackStateFooter
@property (weak, nonatomic, readonly) UIImageView *arrowView;
/** 菊花的样式 */
@property (assign, nonatomic) UIActivityIndicatorViewStyle activityIndicatorViewStyle;

/**
 刷新底部的高度
 */
@property (nonatomic,assign)float footerHeight;
@end
