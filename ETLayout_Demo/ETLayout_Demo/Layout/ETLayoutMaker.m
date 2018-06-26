//
//  ETLayoutMaker.m
//  ETLayout_Demo
//
//  Created by 戴运鹏 on 2018/6/26.
//  Copyright © 2018年 戴运鹏. All rights reserved.
//

#import "ETLayoutMaker.h"
#define WEAKSELF __weak typeof(self) weakSelf = self;

#define LayoutPropertyGetter(X,Y)\
\
__weak typeof(self) weakSelf = self;\
return ^(MASViewAttribute *attribute,float offset){\
    weakSelf.X = ^(MASConstraintMaker *make) {\
        make.Y.equalTo(attribute).offset(offset);\
    };\
    return weakSelf;\
};\
\

#define PropertyExecute(Property) \
\
if (weakSelf.Property) {\
weakSelf.Property(make);\
}\
\

@interface ETLayoutMaker()
@property (nonatomic,weak)UIView *bindView;
@property (nonatomic,copy) void(^et_left)(MASConstraintMaker *make);
@property (nonatomic,copy) void(^et_top)(MASConstraintMaker *make);
@property (nonatomic,copy) void(^et_right)(MASConstraintMaker *make);
@property (nonatomic,copy) void(^et_bottom)(MASConstraintMaker *make);
@property (nonatomic,copy) void(^et_leading)(MASConstraintMaker *make);
@property (nonatomic,copy) void(^et_trailing)(MASConstraintMaker *make);
@property (nonatomic,copy) void(^et_width)(MASConstraintMaker *make);
@property (nonatomic,copy) void(^et_height)(MASConstraintMaker *make);
@property (nonatomic,copy) void(^et_centerX)(MASConstraintMaker *make);
@property (nonatomic,copy) void(^et_centerY)(MASConstraintMaker *make);
@property (nonatomic,copy) void(^et_baseline)(MASConstraintMaker *make);
@property (nonatomic,copy) void(^et_firstBaseline)(MASConstraintMaker *make);
@property (nonatomic,copy) void(^et_lastBaseline)(MASConstraintMaker *make);
@property (nonatomic,copy) void(^et_leftMargin)(MASConstraintMaker *make);
@property (nonatomic,copy) void(^et_rightMargin)(MASConstraintMaker *make);
@property (nonatomic,copy) void(^et_topMargin)(MASConstraintMaker *make);
@property (nonatomic,copy) void(^et_bottomMargin)(MASConstraintMaker *make);
@property (nonatomic,copy) void(^et_leadingMargin)(MASConstraintMaker *make);
@property (nonatomic,copy) void(^et_trailingMargin)(MASConstraintMaker *make);
@property (nonatomic,copy) void(^et_centerXWithinMargins)(MASConstraintMaker *make);
@property (nonatomic,copy) void(^et_centerYWithinMargins)(MASConstraintMaker *make);
@property (nonatomic,copy) void(^et_edges)(MASConstraintMaker *make);
@end

@implementation ETLayoutMaker
- (instancetype)init{
    return nil;
}
- (instancetype)initWithView:(UIView *)view
{
    if (self = [super init]) {
        _bindView = view;
    }
    return self;
}

- (ETConstraintBlock)left
{
    LayoutPropertyGetter(et_left, left)
}

- (ETConstraintBlock)top
{
    LayoutPropertyGetter(et_top, top)
}

- (ETConstraintBlock)right
{
    LayoutPropertyGetter(et_right, right)
}

- (ETConstraintBlock)bottom
{
    LayoutPropertyGetter(et_bottom, bottom)
}

- (ETConstraintBlock)leading
{
    LayoutPropertyGetter(et_leading, leading)
}

- (ETConstraintBlock)trailing
{
    LayoutPropertyGetter(et_trailing, trailing)
}

- (ETSizeConstraintBlock)width
{
    WEAKSELF
    return ^(float size){
        weakSelf.et_width = ^(MASConstraintMaker *make) {
            make.width.mas_equalTo(size);
        };
        return weakSelf;
    };
}

- (ETSizeConstraintBlock)height
{
    WEAKSELF
    return ^(float size){
        weakSelf.et_height = ^(MASConstraintMaker *make) {
            make.height.mas_equalTo(size);
        };
        return weakSelf;
    };
}

- (ETConstraintBlock)centerX
{
    LayoutPropertyGetter(et_centerX, centerX)
}

- (ETConstraintBlock)centerY
{
    LayoutPropertyGetter(et_centerY, centerY)
}

- (ETConstraintBlock)baseline
{
    LayoutPropertyGetter(et_baseline, baseline)
}

- (ETConstraintBlock)firstBaseline
{
    LayoutPropertyGetter(et_firstBaseline, firstBaseline)
}

- (ETConstraintBlock)lastBaseline
{
    LayoutPropertyGetter(et_lastBaseline, lastBaseline)
}

- (ETConstraintBlock)leftMargin
{
    LayoutPropertyGetter(et_leftMargin, leftMargin)
}

- (ETConstraintBlock)rightMargin
{
    LayoutPropertyGetter(et_rightMargin, rightMargin)
}

- (ETConstraintBlock)topMargin
{
    LayoutPropertyGetter(et_topMargin, topMargin)
}

- (ETConstraintBlock)bottomMargin
{
    LayoutPropertyGetter(et_bottomMargin, bottomMargin)
}

- (ETConstraintBlock)leadingMargin
{
    LayoutPropertyGetter(et_leadingMargin, leadingMargin)
}

- (ETConstraintBlock)trailingMargin
{
    LayoutPropertyGetter(et_trailingMargin, trailingMargin)
}

- (ETConstraintBlock)centerXWithinMargins
{
    LayoutPropertyGetter(et_centerXWithinMargins, centerXWithinMargins)
}

- (ETConstraintBlock)centerYWithinMargins
{
    LayoutPropertyGetter(et_centerYWithinMargins, centerYWithinMargins)
}

- (ETEdgesConstraintBlock)edges
{
    WEAKSELF
    return ^(UIView *view, UIEdgeInsets insets){
        weakSelf.et_edges = ^(MASConstraintMaker *make) {
            make.edges.equalTo(view).insets(insets);
        };
        return weakSelf;
    };
}

- (void)install
{
    WEAKSELF
    [self.bindView mas_makeConstraints:^(MASConstraintMaker *make) {

        PropertyExecute(et_left)
        
        PropertyExecute(et_top)

        PropertyExecute(et_right)

        PropertyExecute(et_bottom)
        
        PropertyExecute(et_leading)
        
        PropertyExecute(et_trailing)
        
        PropertyExecute(et_width)
        
        PropertyExecute(et_height)
        
        PropertyExecute(et_centerX)
        
        PropertyExecute(et_centerY)
        
        PropertyExecute(et_baseline)
        
        PropertyExecute(et_firstBaseline)
        
        PropertyExecute(et_lastBaseline)
        
        PropertyExecute(et_leftMargin)
        
        PropertyExecute(et_rightMargin)
        
        PropertyExecute(et_topMargin)
        
        PropertyExecute(et_bottomMargin)
        
        PropertyExecute(et_leadingMargin)
        
        PropertyExecute(et_trailingMargin)
        
        PropertyExecute(et_centerXWithinMargins)
        
        PropertyExecute(et_centerYWithinMargins)
        
        PropertyExecute(et_edges)
    }];
}



@end
