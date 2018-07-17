//
//  ETRefreshHeader.h
//  Refresh_Demo
//
//  Created by 戴运鹏 on 2018/7/17.
//  Copyright © 2018年 戴运鹏. All rights reserved.
//

#import <UIKit/UIKit.h>

///刷新头部的类型
typedef NS_ENUM(NSInteger, ETRefreshHeaderType) {
    ETRefreshHeaderTypeNormal = 0,
    ETRefreshHeaderTypeGif
};

/**
 进入刷新状态的回调
 */
typedef void(^ETRefreshHeaderRefreshingBlock)(void);

/**
 进入刷新后的回调(进入刷新状态后的回调)
 */
typedef void(^ETRefreshHeaderBeginRefreshingBlock)(void);

/**
 结束刷新后的回调
 */
typedef void(^ETRefreshHeaderEndRefreshingBlock)(void);
@interface ETRefreshHeader : UIView

//normalHeader
+ (id)normalHeaderWithRefreshingBlock:(ETRefreshHeaderRefreshingBlock)refreshingBlock;
+ (id)normalHeaderWithRefreshingTarget:(id)target refreshingAction:(SEL)action;
//GifHeader
+ (id)gifHeaderWithRefreshingBlock:(ETRefreshHeaderRefreshingBlock)refreshingBlock;
+ (id)gifHeaderWithRefreshingTarget:(id)target refreshingAction:(SEL)action;

@property (nonatomic,assign,readonly)ETRefreshHeaderType refreshType;
@end
