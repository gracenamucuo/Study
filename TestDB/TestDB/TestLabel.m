
//
//  TestLabel.m
//  TestDB
//
//  Created by 戴运鹏 on 2018/10/11.
//  Copyright © 2018年 戴运鹏. All rights reserved.
//

#import "TestLabel.h"

@implementation TestLabel

- (void)drawTextInRect:(CGRect)rect
{
    [super drawTextInRect:UIEdgeInsetsInsetRect(rect, self.textInsets)];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
