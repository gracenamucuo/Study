//
//  RedViewLayout.h
//  Layout_Demo
//
//  Created by 戴运鹏 on 2018/6/24.
//  Copyright © 2018年 戴运鹏. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ETLayoutable.h"
@class ETViewLayout;

/**
约束block
 @param relatedView 参照的view
 @param direction 参照view的约束的方向
 @param offset 偏移量
 @return 返回当前布局类的实例
 */
typedef ETViewLayout *(^ETConstraint)(UIView *relatedView,NSLayoutAttribute direction,CGFloat offset);

@interface ETViewLayout : NSObject<ETLayoutable>
@property (nonatomic,copy)ETConstraint left;
@property (nonatomic,copy)ETConstraint right;
@property (nonatomic,copy)ETConstraint top;
@property (nonatomic,copy)ETConstraint bottom;
@property (nonatomic,copy)ETConstraint leading;
@property (nonatomic,copy)ETConstraint trailing;
@property (nonatomic,copy)ETConstraint width;
@property (nonatomic,copy)ETConstraint height;


@end
