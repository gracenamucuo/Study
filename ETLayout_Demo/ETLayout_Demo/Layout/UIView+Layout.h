//
//  UIView+Layout.h
//  ETLayout_Demo
//
//  Created by 戴运鹏 on 2018/6/26.
//  Copyright © 2018年 戴运鹏. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ETLayoutMaker.h"
@interface UIView (Layout)

@property (nonatomic, strong, readonly) id et_left;
@property (nonatomic, strong, readonly) id et_top;
@property (nonatomic, strong, readonly) id et_right;
@property (nonatomic, strong, readonly) id et_bottom;
@property (nonatomic, strong, readonly) id et_leading;
@property (nonatomic, strong, readonly) id et_trailing;
@property (nonatomic, strong, readonly) id et_centerX;
@property (nonatomic, strong, readonly) id et_centerY;
@property (nonatomic, strong, readonly) id et_baseline;
@property (nonatomic, strong, readonly) id et_firstBaseline;
@property (nonatomic, strong, readonly) id et_lastBaseline;
@property (nonatomic, strong, readonly) id et_leftMargin;
@property (nonatomic, strong, readonly) id et_rightMargin;
@property (nonatomic, strong, readonly) id et_topMargin;
@property (nonatomic, strong, readonly) id et_bottomMargin;
@property (nonatomic, strong, readonly) id et_leadingMargin;
@property (nonatomic, strong, readonly) id et_trailingMargin;
@property (nonatomic, strong, readonly) id et_centerXWithinMargins;
@property (nonatomic, strong, readonly) id et_centerYWithinMargins;

@property (nonatomic, strong, readonly) id et_safeAreaLayoutGuide NS_AVAILABLE_IOS(11.0);
@property (nonatomic, strong, readonly) id et_safeAreaLayoutGuideLeading NS_AVAILABLE_IOS(11.0);
@property (nonatomic, strong, readonly) id et_safeAreaLayoutGuideTrailing NS_AVAILABLE_IOS(11.0);
@property (nonatomic, strong, readonly) id et_safeAreaLayoutGuideLeft NS_AVAILABLE_IOS(11.0);
@property (nonatomic, strong, readonly) id et_safeAreaLayoutGuideRight NS_AVAILABLE_IOS(11.0);
@property (nonatomic, strong, readonly) id et_safeAreaLayoutGuideTop NS_AVAILABLE_IOS(11.0);
@property (nonatomic, strong, readonly) id et_safeAreaLayoutGuideBottom NS_AVAILABLE_IOS(11.0);
@property (nonatomic, strong, readonly) id et_safeAreaLayoutGuideWidth NS_AVAILABLE_IOS(11.0);
@property (nonatomic, strong, readonly) id et_safeAreaLayoutGuideHeight NS_AVAILABLE_IOS(11.0);
@property (nonatomic, strong, readonly) id et_safeAreaLayoutGuideCenterX NS_AVAILABLE_IOS(11.0);
@property (nonatomic, strong, readonly) id et_safeAreaLayoutGuideCenterY NS_AVAILABLE_IOS(11.0);


- (void)et_makeConstraint:(void(^)(ETLayoutMaker *make))block;

@end
