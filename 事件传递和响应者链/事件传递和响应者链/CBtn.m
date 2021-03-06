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
    [self printResponderChain];//已进入这个方法，就说明事件被消耗了。
    [super touchesBegan:touches withEvent:event];
    NSLog(@"%s",__func__);
}
- (void)printResponderChain
{
    UIResponder *responder = self;
    NSLog(@"%@",NSStringFromClass([responder class]));
    while (responder.nextResponder) {
        responder = responder.nextResponder;
        NSLog(@"---->%@",NSStringFromClass([responder class]));
    }
}


@end
