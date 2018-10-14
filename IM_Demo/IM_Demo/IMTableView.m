//
//  IMTableView.m
//  IM_Demo
//
//  Created by 戴运鹏 on 2018/10/14.
//  Copyright © 2018年 戴运鹏. All rights reserved.
//

#import "IMTableView.h"

@implementation IMTableView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [super touchesBegan:touches withEvent:event];
    [[UIApplication sharedApplication].keyWindow endEditing:YES];
}

@end
