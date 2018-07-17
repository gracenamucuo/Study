//
//  ETRefreshNormalHeader.h
//  Refresh_Demo
//
//  Created by 戴运鹏 on 2018/7/17.
//  Copyright © 2018年 戴运鹏. All rights reserved.
//

#import "MJRefreshStateHeader.h"

@interface ETRefreshNormalHeader : MJRefreshStateHeader
@property (weak, nonatomic,readonly) UIImageView *arrowView;

/** 菊花的样式 */
@property (assign, nonatomic) UIActivityIndicatorViewStyle activityIndicatorViewStyle;

/**
 更换箭头图标
 */
@property (nonatomic,strong)UIImage *arrowImage;

/**
 刷新头部的高度
 */
@property (nonatomic,assign)float headerHeight;

/**
 箭头(菊花)的水平中心距离；
 最大值【(ScreenW / 2) - (文字宽度/2) - (labelLeftInset) - (图标的宽度 / 2)】
 最小值为图标的宽度的一半

 */
@property (nonatomic,assign)float arrowCenterX;
@end
