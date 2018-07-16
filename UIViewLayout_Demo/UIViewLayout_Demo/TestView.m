//
//  TestView.m
//  UIViewLayout_Demo
//
//  Created by 戴运鹏 on 2018/7/12.
//  Copyright © 2018年 戴运鹏. All rights reserved.
//

#import "TestView.h"

@implementation TestView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (void)layoutSubviews
{
    [super layoutSubviews];
    NSLog(@"%@  ",[self class]);
}

@end
