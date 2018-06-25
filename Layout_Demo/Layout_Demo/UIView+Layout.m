//
//  UIView+Layout.m
//  Layout_Demo
//
//  Created by 戴运鹏 on 2018/6/24.
//  Copyright © 2018年 戴运鹏. All rights reserved.
//

#import "UIView+Layout.h"

@implementation UIView (Layout)

- (void)makeLayout:(id<ETLayoutable>)layouter
{
    [self mas_makeConstraints:[layouter layoutMaker]];
}

@end
