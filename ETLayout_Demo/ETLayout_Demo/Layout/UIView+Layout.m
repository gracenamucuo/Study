//
//  UIView+Layout.m
//  ETLayout_Demo
//
//  Created by 戴运鹏 on 2018/6/26.
//  Copyright © 2018年 戴运鹏. All rights reserved.
//

#import "UIView+Layout.h"
#import "ETLayoutMaker.h"
@implementation UIView (Layout)

- (id)et_left
{
    return self.mas_left;
}

- (id)et_top
{
    return self.mas_top;
}

- (id)et_right
{
    return self.mas_right;
}

- (id)et_bottom
{
    return self.mas_bottom;
}

- (id)et_leading
{
    return self.mas_leading;
}

- (id)et_trailing
{
    return self.mas_trailing;
}

- (id)et_centerX
{
    return self.mas_centerX;
}

- (id)et_centerY
{
    return self.mas_centerY;
}

- (id)et_baseline
{
    return self.mas_baseline;
}

- (id)et_firstBaseline
{
    return self.mas_firstBaseline;
}

- (id)et_lastBaseline
{
    return self.mas_lastBaseline;
}

- (id)et_leftMargin
{
    return self.mas_leftMargin;
}

- (id)et_rightMargin
{
    return self.mas_rightMargin;
}

- (id)et_topMargin
{
    return self.mas_topMargin;
}

- (id)et_bottomMargin
{
    return self.mas_bottomMargin;
}

- (id)et_leadingMargin
{
    return self.mas_leadingMargin;
}

- (id)et_trailingMargin
{
    return self.mas_trailingMargin;
}


- (id)et_centerXWithinMargins
{
    return self.mas_centerXWithinMargins;
}

- (id)et_centerYWithinMargins
{
    return self.mas_centerYWithinMargins;
}

- (id)et_safeAreaLayoutGuide
{
    return self.mas_safeAreaLayoutGuide;
}

- (id)et_safeAreaLayoutGuideLeading
{
    return self.mas_safeAreaLayoutGuideLeading;
}

- (id)et_safeAreaLayoutGuideTrailing
{
    return self.mas_safeAreaLayoutGuideTrailing;
}

- (id)et_safeAreaLayoutGuideLeft
{
    return self.mas_safeAreaLayoutGuideLeft;
}

- (id)et_safeAreaLayoutGuideRight
{
    return self.mas_safeAreaLayoutGuideRight;
}

- (id)et_safeAreaLayoutGuideTop
{
    return self.mas_safeAreaLayoutGuideTop;
}

- (id)et_safeAreaLayoutGuideBottom
{
    return self.mas_safeAreaLayoutGuideBottom;
}

- (id)et_safeAreaLayoutGuideWidth
{
    return self.mas_safeAreaLayoutGuideWidth;
}

- (id)et_safeAreaLayoutGuideHeight
{
    return self.mas_safeAreaLayoutGuideHeight;
}

- (id)et_safeAreaLayoutGuideCenterX
{
    return self.mas_safeAreaLayoutGuideCenterX;
}

- (id)et_safeAreaLayoutGuideCenterY
{
    return self.mas_safeAreaLayoutGuideCenterY;
}


- (void)et_makeConstraint:(void (^)(ETLayoutMaker *))block
{
    ETLayoutMaker *layoutMaker = [[ETLayoutMaker alloc]initWithView:self];
    block(layoutMaker);
    [layoutMaker install];
}

@end
