//
//  ETRefreshAutoNormalFooter.h
//  Refresh_Demo
//
//  Created by 戴运鹏 on 2018/7/18.
//  Copyright © 2018年 戴运鹏. All rights reserved.
//

#import "MJRefreshAutoStateFooter.h"

@interface ETRefreshAutoNormalFooter : MJRefreshAutoStateFooter
/**
 刷新头部的高度
 */
@property (nonatomic,assign)float footerHeight;
/** 菊花的样式 */
@property (assign, nonatomic) UIActivityIndicatorViewStyle activityIndicatorViewStyle;
@end
