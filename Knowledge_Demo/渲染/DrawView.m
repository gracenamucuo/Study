//
//  DrawView.m
//  渲染
//
//  Created by 戴运鹏 on 2019/2/27.
//  Copyright © 2019 戴运鹏. All rights reserved.
//

#import "DrawView.h"

@implementation DrawView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor redColor];
    }
    return self;
}

- (void)drawRect:(CGRect)rect
{
    [super drawRect:rect];
    NSLog(@"%@",NSStringFromSelector(_cmd));
}

- (void)drawLayer:(CALayer *)layer inContext:(CGContextRef)ctx
{
    NSLog(@"%@",NSStringFromSelector(_cmd));
}

//- (void)displayLayer:(CALayer *)layer
//{
//    NSLog(@"%@",NSStringFromSelector(_cmd));
//}

@end
