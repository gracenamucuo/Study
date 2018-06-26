//
//  ETLayoutMaker.h
//  ETLayout_Demo
//
//  Created by 戴运鹏 on 2018/6/26.
//  Copyright © 2018年 戴运鹏. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Masonry.h"

@class ETLayoutMaker;

typedef ETLayoutMaker *(^ETConstraintBlock)(MASViewAttribute *attribute, float offset);

typedef ETLayoutMaker *(^ETSizeConstraintBlock)(float size);

typedef ETLayoutMaker *(^ETEdgesConstraintBlock)(UIView *view,UIEdgeInsets insets);

@interface ETLayoutMaker : NSObject
@property (nonatomic,copy,readonly)ETConstraintBlock left;
@property (nonatomic,copy,readonly)ETConstraintBlock top;
@property (nonatomic,copy,readonly)ETConstraintBlock right;
@property (nonatomic,copy,readonly)ETConstraintBlock bottom;
@property (nonatomic,copy,readonly)ETConstraintBlock leading;
@property (nonatomic,copy,readonly)ETConstraintBlock trailing;
@property (nonatomic,copy,readonly)ETSizeConstraintBlock width;
@property (nonatomic,copy,readonly)ETSizeConstraintBlock height;
@property (nonatomic,copy,readonly)ETConstraintBlock centerX;
@property (nonatomic,copy,readonly)ETConstraintBlock centerY;
@property (nonatomic,copy,readonly)ETConstraintBlock baseline;
@property (nonatomic,copy,readonly)ETConstraintBlock firstBaseline;
@property (nonatomic,copy,readonly)ETConstraintBlock lastBaseline;
@property (nonatomic,copy,readonly)ETConstraintBlock leftMargin;
@property (nonatomic,copy,readonly)ETConstraintBlock rightMargin;
@property (nonatomic,copy,readonly)ETConstraintBlock topMargin;
@property (nonatomic,copy,readonly)ETConstraintBlock bottomMargin;
@property (nonatomic,copy,readonly)ETConstraintBlock leadingMargin;
@property (nonatomic,copy,readonly)ETConstraintBlock trailingMargin;
@property (nonatomic,copy,readonly)ETConstraintBlock centerXWithinMargins;
@property (nonatomic,copy,readonly)ETConstraintBlock centerYWithinMargins;
@property (nonatomic,copy,readonly)ETEdgesConstraintBlock edges;

- (instancetype)initWithView:(UIView *)view;
- (instancetype)init UNAVAILABLE_ATTRIBUTE;
- (void)install;

@end
