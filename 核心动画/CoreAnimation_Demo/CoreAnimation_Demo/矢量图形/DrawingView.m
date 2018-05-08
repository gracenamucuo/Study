//
//  DrawingView.m
//  CoreAnimation_Demo
//
//  Created by 戴运鹏 on 2018/5/7.
//  Copyright © 2018年 戴运鹏. All rights reserved.
//

#import "DrawingView.h"

@interface DrawingView()
@property (nonatomic,strong)UIBezierPath *path;
@end

@implementation DrawingView

- (instancetype)init
{
    self = [super init];
    if (self) {
        _path = [UIBezierPath bezierPath];
        _path.lineJoinStyle = kCGLineJoinRound;
        _path.lineCapStyle = kCGLineCapRound;
        _path.lineWidth = 5;
        CAShapeLayer *shapeLayer = (CAShapeLayer*)self.layer;
        shapeLayer.strokeColor = [UIColor redColor].CGColor;
        shapeLayer.fillColor = [UIColor clearColor].CGColor;
        shapeLayer.lineJoin = kCALineJoinRound;
        shapeLayer.lineCap = kCALineCapRound;
        
    }
    return self;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [super touchesBegan:touches withEvent:event];
    CGPoint point = [[touches anyObject]locationInView:self];
    [self.path moveToPoint:point];
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [super touchesMoved:touches withEvent:event];
    CGPoint point = [[touches anyObject]locationInView:self];
    [self.path addLineToPoint:point];
    ((CAShapeLayer*)self.layer).path = self.path.CGPath;
}

//- (void)drawRect:(CGRect)rect
//{
//    [[UIColor clearColor]setFill];
//    [[UIColor redColor]setStroke];
//    [self.path stroke];
//}

+ (Class)layerClass
{
    return [CAShapeLayer class];
}
@end

























