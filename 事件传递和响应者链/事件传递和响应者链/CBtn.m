//
//  CBtn.m
//  事件传递和响应者链
//
//  Created by 戴运鹏 on 2018/8/18.
//  Copyright © 2018年 戴运鹏. All rights reserved.
//

#import "CBtn.h"

@implementation CBtn

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event
{
    NSLog(@"%s",__func__);
  return [super hitTest:point withEvent:event];
}
- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event
{
    NSLog(@"%s",__func__);
   return [super pointInside:point withEvent:event];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    NSLog(@"%s",__func__);
}


@end
