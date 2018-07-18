//
//  ETRefreshGifHeader.h
//  Refresh_Demo
//
//  Created by 戴运鹏 on 2018/7/17.
//  Copyright © 2018年 戴运鹏. All rights reserved.
//

#import "MJRefreshStateHeader.h"

@interface ETRefreshGifHeader : MJRefreshStateHeader
@property (weak, nonatomic, readonly) UIImageView *gifView;

/**
 刷新头部的高度
 */
@property (nonatomic,assign)float headerHeight;

/** 设置state状态下的动画图片images 动画持续时间duration*/
- (void)setImages:(NSArray *)images duration:(NSTimeInterval)duration forState:(MJRefreshState)state;
- (void)setImages:(NSArray *)images forState:(MJRefreshState)state;
@end
