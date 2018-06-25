//
//  RedViewLayout.m
//  Layout_Demo
//
//  Created by 戴运鹏 on 2018/6/24.
//  Copyright © 2018年 戴运鹏. All rights reserved.
//

#import "ETViewLayout.h"
#import "ETLayoutAttributeMaker.h"
#import "MASConstraint.h"

#define WEAKSELF __weak typeof(self) weakSelf = self;

@interface ETViewLayout()
@property (nonatomic,strong) MASConstraintMaker *maker;
@property (nonatomic,strong)NSMutableArray <NSDictionary *> *constraintsArray;//{MASViewAttributeKey:(MASViewAttribute的实例),DirectionKey:(该约束自身的方向),OffsetKey:(偏移量)}
@end

static NSString *MASViewAttributeKey = @"MASViewAttributeKey";
static NSString *DirectionKey = @"DirectionKey";
static NSString *OffsetKey = @"OffsetKey";
@implementation ETViewLayout

- (LayoutMaker)layoutMaker
{
    return ^(MASConstraintMaker *maker){
        self.maker = maker;
        [self installConstraints];
    };
}

- (NSMutableArray *)constraintsArray
{
    if (!_constraintsArray) {
        _constraintsArray = [NSMutableArray array];
    }
    return _constraintsArray;
}

- (ETConstraint)left
{
    WEAKSELF
    return ^(UIView *relatedView,NSLayoutAttribute direction,CGFloat offset){
        [weakSelf.constraintsArray addObject: @{MASViewAttributeKey:[ETLayoutAttributeMaker makeLayoutAttributeWithView:relatedView direction:direction],DirectionKey:@(NSLayoutAttributeLeft),OffsetKey:@(offset)}];
        return weakSelf;
    };
}
- (ETConstraint)right
{
    WEAKSELF
    return ^(UIView *relatedView,NSLayoutAttribute direction,CGFloat offset){
     [weakSelf.constraintsArray addObject: @{MASViewAttributeKey:[ETLayoutAttributeMaker makeLayoutAttributeWithView:relatedView direction:direction],DirectionKey:@(NSLayoutAttributeRight),OffsetKey:@(offset)}];
        return weakSelf;
    };
}

- (ETConstraint)top
{
    WEAKSELF
    return ^(UIView *relatedView,NSLayoutAttribute direction,CGFloat offset){
         [weakSelf.constraintsArray addObject: @{MASViewAttributeKey:[ETLayoutAttributeMaker makeLayoutAttributeWithView:relatedView direction:direction],DirectionKey:@(NSLayoutAttributeTop),OffsetKey:@(offset)}];
        return weakSelf;
    };
}

- (ETConstraint)bottom{
    WEAKSELF
    return ^(UIView *relatedView,NSLayoutAttribute direction,CGFloat offset){
        [weakSelf.constraintsArray addObject: @{MASViewAttributeKey:[ETLayoutAttributeMaker makeLayoutAttributeWithView:relatedView direction:direction],DirectionKey:@(NSLayoutAttributeBottom),OffsetKey:@(offset)}];
        return weakSelf;
    };
}

- (ETConstraint)leading
{
    WEAKSELF
    return ^(UIView *relatedView,NSLayoutAttribute direction,CGFloat offset){
        [weakSelf.constraintsArray addObject: @{MASViewAttributeKey:[ETLayoutAttributeMaker makeLayoutAttributeWithView:relatedView direction:direction],DirectionKey:@(NSLayoutAttributeLeading),OffsetKey:@(offset)}];
        return weakSelf;
    };
}

- (ETConstraint)trailing
{
    WEAKSELF
    return ^(UIView *relatedView,NSLayoutAttribute direction,CGFloat offset){
        [weakSelf.constraintsArray addObject: @{MASViewAttributeKey:[ETLayoutAttributeMaker makeLayoutAttributeWithView:relatedView direction:direction],DirectionKey:@(NSLayoutAttributeTrailing),OffsetKey:@(offset)}];
        return weakSelf;
    };
}

- (ETConstraint)width
{
    WEAKSELF
    return ^(UIView *relatedView,NSLayoutAttribute direction,CGFloat offset){
        [weakSelf.constraintsArray addObject: @{MASViewAttributeKey:[ETLayoutAttributeMaker makeLayoutAttributeWithView:relatedView direction:direction],DirectionKey:@(NSLayoutAttributeWidth),OffsetKey:@(offset)}];
        return weakSelf;
    };
}

- (ETConstraint)height
{
    WEAKSELF
    return ^(UIView *relatedView,NSLayoutAttribute direction,CGFloat offset){
        [weakSelf.constraintsArray addObject: @{MASViewAttributeKey:[ETLayoutAttributeMaker makeLayoutAttributeWithView:relatedView direction:direction],DirectionKey:@(NSLayoutAttributeHeight),OffsetKey:@(offset)}];
        return weakSelf;
    };
}

///添加约束
- (void)installConstraints{
    if (self.constraintsArray.count == 0) return;
    for (NSDictionary *dic in self.constraintsArray) {
        NSLayoutAttribute direction = [dic[DirectionKey] integerValue];
        CGFloat offset = [dic[OffsetKey] floatValue];
        MASViewAttribute *viewAttri;
        if (direction != NSLayoutAttributeHeight || direction != NSLayoutAttributeWidth) {
            viewAttri = dic[MASViewAttributeKey];
        }
        
        switch (direction) {
            case 1:
               self.maker.left.equalTo(viewAttri).offset(offset);
                break;
            case 2:
                self.maker.right.equalTo(viewAttri).offset(offset);
                break;
            case 3:
                self.maker.top.equalTo(viewAttri).offset(offset);
                break;
            case 4:
                self.maker.bottom.equalTo(viewAttri).offset(offset);
                break;
            case 5:
                self.maker.leading.equalTo(viewAttri).offset(offset);
                break;
            case 6:
                self.maker.trailing.equalTo(viewAttri).offset(offset);
                break;
            case 7:
                self.maker.width.mas_equalTo(offset);
                break;
            case 8:
                self.maker.height.mas_equalTo(offset);
                break;
            case 9:
                self.maker.centerX.equalTo(viewAttri).offset(offset);
                break;
            case 10:
                self.maker.centerY.equalTo(viewAttri).offset(offset);
                break;
            case 11:
                self.maker.lastBaseline.equalTo(viewAttri).offset(offset);
                break;
            case 12:
                self.maker.firstBaseline.equalTo(viewAttri).offset(offset);
                break;
            case 13:
                self.maker.leftMargin.equalTo(viewAttri).offset(offset);
                break;
            case 14:
                self.maker.rightMargin.equalTo(viewAttri).offset(offset);
                break;
            case 15:
                self.maker.topMargin.equalTo(viewAttri).offset(offset);
                break;
            case 16:
                self.maker.bottomMargin.equalTo(viewAttri).offset(offset);
                break;
            case 17:
                self.maker.leadingMargin.equalTo(viewAttri).offset(offset);
                break;
            case 18:
                self.maker.trailingMargin.equalTo(viewAttri).offset(offset);
                break;
            case 19:
                self.maker.centerXWithinMargins.equalTo(viewAttri).offset(offset);
                break;
            case 20:
                self.maker.centerYWithinMargins.equalTo(viewAttri).offset(offset);
                break;
                
            default:
                break;
        }
        
    }
}

@end
