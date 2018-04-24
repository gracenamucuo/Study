//
//  CustomDrawingController.m
//  CoreAnimation_Demo
//
//  Created by 戴运鹏 on 2018/4/24.
//  Copyright © 2018年 戴运鹏. All rights reserved.
//

#import "CustomDrawingController.h"

@interface CustomDrawingController ()<CALayerDelegate>

@end

@implementation CustomDrawingController

- (void)viewDidLoad {
    [super viewDidLoad];
    CALayer *blueLayer = [CALayer layer];
    blueLayer.frame = CGRectMake(50.f, 50.f, 100.f, 100.f);
    blueLayer.backgroundColor = [UIColor blueColor].CGColor;
    blueLayer.delegate = self;
    blueLayer.contentsScale = [UIScreen mainScreen].scale;
    [self.view.layer addSublayer:blueLayer];
    [blueLayer display];
}



- (void)drawLayer:(CALayer *)layer inContext:(CGContextRef)ctx
{
    CGContextSetLineWidth(ctx, 10.f);
    CGContextSetStrokeColorWithColor(ctx, [UIColor yellowColor].CGColor);
    CGContextStrokeEllipseInRect(ctx, layer.bounds);
}














@end
