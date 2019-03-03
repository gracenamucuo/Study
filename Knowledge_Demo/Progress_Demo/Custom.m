//
//  Custom.m
//  Progress_Demo
//
//  Created by 戴运鹏 on 2019/3/2.
//  Copyright © 2019 戴运鹏. All rights reserved.
//

#import "Custom.h"

@implementation Custom

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.backgroundColor = [UIColor redColor];
    }
    return self;
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
//- (void)drawRect:(CGRect)rect {
//    CGFloat lineWidth = 2.f;
//    UIBezierPath *processBackgroundPath = [UIBezierPath bezierPath];
//    processBackgroundPath.lineWidth = lineWidth;
//    processBackgroundPath.lineCapStyle = kCGLineCapButt;
//    CGPoint center = CGPointMake(CGRectGetMidX(self.bounds), CGRectGetMidY(self.bounds));
//    CGFloat radius = (self.bounds.size.width - lineWidth)/2;
//    CGFloat startAngle = - ((float)M_PI / 2); // 90 degrees
//    CGFloat endAngle = (2 * (float)M_PI) + startAngle;
//    [processBackgroundPath addArcWithCenter:center radius:radius startAngle:startAngle endAngle:endAngle clockwise:YES];
//    [[UIColor blueColor]set];
//    [processBackgroundPath stroke];
//    // Draw progress
//    UIBezierPath *processPath = [UIBezierPath bezierPath];
//    processPath.lineCapStyle = kCGLineCapSquare;
//    processPath.lineWidth = lineWidth;
//    endAngle = (0.9* 2 * (float)M_PI) + startAngle;
//    [processPath addArcWithCenter:center radius:radius startAngle:startAngle endAngle:endAngle clockwise:YES];
//    [[UIColor yellowColor] set];
//    [processPath stroke];
//}


- (void)dealloc
{
    NSLog(@"释放了");
}
@end
