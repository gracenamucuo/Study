//
//  TestLabel.m
//  DataBaseDemo
//
//  Created by 戴运鹏 on 2018/9/21.
//  Copyright © 2018年 戴运鹏. All rights reserved.
//

#import "TestLabel.h"

@interface TestLabel ()
@end

@implementation TestLabel

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _textInsets = UIEdgeInsetsZero;
    }
    return self;
}

//- (void)drawTextInRect:(CGRect)rect
//{
//    [super drawTextInRect:UIEdgeInsetsInsetRect(rect, self.textInsets)];
//}


@end
