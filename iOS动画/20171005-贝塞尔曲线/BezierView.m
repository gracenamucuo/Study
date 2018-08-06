//
//  BezierView.m
//  20171005-贝塞尔曲线
//
//  Created by 戴运鹏 on 2017/10/5.
//  Copyright © 2017年 戴运鹏. All rights reserved.
//

#import "BezierView.h"

/*
 1、 重写View的drawRect方法
 
 2、 创建UIBezierPath的对象
 
 3、 使用方法moveToPoint: 设置初始点
 
 4、 根据具体要求使用UIBezierPath类方法绘图（比如要画线、矩形、圆、弧？等）
 
 5、 设置UIBezierPath对象相关属性 （比如lineWidth、lineJoinStyle、aPath.lineCapStyle、color）
 
 6、 使用stroke 或者 fill方法结束绘图
 */
@implementation BezierView
/*
 + (instancetype)bezierPath;   //初始化贝塞尔曲线(无形状)
 + (instancetype)bezierPathWithRect:(CGRect)rect;  //绘制矩形贝塞尔曲线
 + (instancetype)bezierPathWithOvalInRect:(CGRect)rect;  //绘制椭圆（圆形）曲线
 + (instancetype)bezierPathWithRoundedRect:(CGRect)rect cornerRadius:(CGFloat)cornerRadius; // 绘制含有圆角的贝塞尔曲线
 + (instancetype)bezierPathWithRoundedRect:(CGRect)rect byRoundingCorners:(UIRectCorner)corners cornerRadii:(CGSize)cornerRadii;  //绘制可选择圆角方位的贝塞尔曲线
 + (instancetype)bezierPathWithArcCenter:(CGPoint)center radius:(CGFloat)radius startAngle:(CGFloat)startAngle endAngle:(CGFloat)endAngle clockwise:(BOOL)clockwise;   //绘制圆弧曲线
 + (instancetype)bezierPathWithCGPath:(CGPathRef)CGPath; //根据CGPathRef绘制贝塞尔曲线
 

 - (void)moveToPoint:(CGPoint)point;  //贝塞尔曲线开始的点
 - (void)addLineToPoint:(CGPoint)point;  //添加直线到该点
 - (void)addCurveToPoint:(CGPoint)endPoint controlPoint1:(CGPoint)controlPoint1 controlPoint2:(CGPoint)controlPoint2;  //添加二次曲线到该点
 - (void)addQuadCurveToPoint:(CGPoint)endPoint controlPoint:(CGPoint)controlPoint; //添加曲线到该点
 - (void)addArcWithCenter:(CGPoint)center radius:(CGFloat)radius startAngle:(CGFloat)startAngle endAngle:(CGFloat)endAngle clockwise:(BOOL)clockwise NS_AVAILABLE_IOS(4_0);  //添加圆弧 注:上一个点会以直线的形式连接到圆弧的起点
 - (void)closePath;  //闭合曲线
 
 - (void)removeAllPoints; //去掉所有曲线点
 
 @property(nonatomic) CGFloat lineWidth;  //边框宽度
 @property(nonatomic) CGLineCap lineCapStyle;  //端点类型
 @property(nonatomic) CGLineJoin lineJoinStyle;  //线条连接类型
 @property(nonatomic) CGFloat miterLimit;  //线条最大宽度最大限制
 - (void)setLineDash:(nullable const CGFloat *)pattern count:(NSInteger)count phase:(CGFloat)phase;  //虚线类型
 - (void)fill;  //填充贝塞尔曲线内部
 - (void)stroke; //绘制贝塞尔曲线边框
 

 */

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
    }
    return self;
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    //========================================================================
//    //矩形贝塞尔曲线
//    UIBezierPath *bezier_rect = [UIBezierPath bezierPathWithRect:CGRectMake(10, 50, 150, 100)];
////    [bezier_rect moveToPoint:CGPointMake(60, 100)];
//////    [bezier_rect addLineToPoint:CGPointMake(40, 80)];
//////    [bezier_rect addLineToPoint:CGPointMake(100, 100)];
//    bezier_rect.lineCapStyle = kCGLineCapRound;
//    bezier_rect.lineJoinStyle = kCGLineJoinRound;
////    bezier_rect.miterLimit = 3;
//////    CGFloat dash[] = {20,1};
//////    [bezier_rect setLineDash:dash count:2 phase:0];
//    bezier_rect.lineWidth = 1;
////    [[UIColor redColor] setFill];
////    [bezier_rect fill];
////
//    [[UIColor blackColor]set];
//    [bezier_rect stroke];
    
//    UIBezierPath *path = [UIBezierPath bezierPath];
//    [path moveToPoint:CGPointMake(0,100)];//这里相当于起点
//    [path addLineToPoint:CGPointMake(50, 200)];//从起点到该点
//    [path addLineToPoint:CGPointMake(100, 100)];//从上一点到该点
//    path.lineWidth = 5.f;
//    [[UIColor redColor]setStroke];
//    [path stroke];
    
    //===========================================================================
//    UIBezierPath *bezierPath = [UIBezierPath bezierPath];
//    bezierPath.lineWidth = 5.f;
//    [bezierPath moveToPoint:CGPointMake(10, 520)];
//    [bezierPath addLineToPoint:CGPointMake(50, 530)];
//    [bezierPath addQuadCurveToPoint:CGPointMake(100, 510) controlPoint:CGPointMake(80, 650)];
//    [bezierPath addCurveToPoint:CGPointMake(200, 530) controlPoint1:CGPointMake(130, 600) controlPoint2:CGPointMake(170, 400)];
//    [bezierPath addArcWithCenter:CGPointMake(10, 520) radius:50 startAngle:M_PI endAngle:M_PI * 1.5 clockwise:YES];
//    [bezierPath moveToPoint:CGPointMake(300, 520)];
//    [bezierPath addLineToPoint:CGPointMake(40, 520)];
//    [[UIColor blackColor]setStroke];
//    [bezierPath stroke];
//
//
//    CALayer *aniLayer = [CALayer layer];
//    aniLayer.backgroundColor = [UIColor redColor].CGColor;
//    aniLayer.position = CGPointMake(10, 520);
//    aniLayer.bounds = CGRectMake(0, 0, 8, 8);
//    aniLayer.cornerRadius = 4;
//    [self.layer addSublayer:aniLayer];
//
//    CAKeyframeAnimation *keyAni = [CAKeyframeAnimation animationWithKeyPath:@"position"];
//    keyAni.repeatCount = NSIntegerMax;
//    keyAni.path = bezierPath.CGPath;
//    keyAni.duration = 15;
//    keyAni.beginTime = CACurrentMediaTime() + 1;
//    [aniLayer addAnimation:keyAni forKey:@"keyAni"];
 //========================================================================//一段弧线
//    UIBezierPath *arcBezierPath = [UIBezierPath bezierPathWithArcCenter:self.center radius:50 startAngle:M_PI * 1 / 2 endAngle:M_PI  clockwise:YES];
//    arcBezierPath.lineWidth = 5.f;
//    [[UIColor blackColor]set];
//    [arcBezierPath stroke];
    
    //==================二阶=====三阶==============
//    UIColor *color = [UIColor redColor];
//    [color set];
//    UIBezierPath *twoPath = [UIBezierPath bezierPath];
//    twoPath.lineWidth = 5.f;
//    twoPath.lineCapStyle = kCGLineCapButt;
//    twoPath.lineJoinStyle = kCGLineJoinRound;
//    [twoPath moveToPoint:CGPointMake(0, 100)];
////    [twoPath addQuadCurveToPoint:CGPointMake(120, 100) controlPoint:CGPointMake(70, 0)];//二阶曲线有一个控制点，三阶曲线有两个控制点
//    [twoPath addCurveToPoint:CGPointMake(200, 100) controlPoint1:CGPointMake(50, 0) controlPoint2:CGPointMake(150, 200)];
//    [twoPath stroke];
    
    //==========Core Graphics======
//    CGMutablePathRef cgPath = CGPathCreateMutable();
////    CGPathAddEllipseInRect(cgPath, NULL, CGRectMake(0, 0, 300, 300));
////    CGPathAddEllipseInRect(cgPath, NULL, CGRectMake(50, 50, 200, 200));
//    CGPathAddArc(cgPath, NULL, 50, 50, 25, 0, M_PI, YES);//用该方法与上面的画弧线的方法的方向相反。
//    UIBezierPath *path = [UIBezierPath bezierPath];
//    path.CGPath = cgPath;
//    path.usesEvenOddFillRule = YES;
//    CGPathRelease(cgPath);
//    path.lineWidth = 5;
//    [[UIColor redColor]setFill];
//    [path fill];
    
//    UIBezierPath *apath = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, 200, 100)];
//    [[UIColor blackColor] setStroke];
//    [[UIColor redColor] setFill];
//    CGContextRef aRef = UIGraphicsGetCurrentContext();
//    CGContextSaveGState(aRef);
//    CGContextTranslateCTM(aRef, 50, 50);
//    apath.lineWidth = 5.f;
//    [apath fill];
//    [apath stroke];
//    CGContextRestoreGState(aRef);
//    CGContextRelease(aRef);
    
    
//    UIBezierPath *b = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(10, 20, 200, 100) cornerRadius:5.f];
//    b.lineWidth = 5.f;
//
//    [[UIColor redColor] setStroke];
//    [b stroke];
//
//    UIBezierPath *b1 = [UIBezierPath bezierPath];
//    [b1 moveToPoint:CGPointMake(20, 20)];
//    [b1 addLineToPoint:CGPointMake(50, 20)];
//    b1.lineWidth = 5.5f;
//    [[UIColor whiteColor]setStroke];
//    [b1 stroke];
 
    UIBezierPath *bezier = [UIBezierPath bezierPath];
    [bezier moveToPoint:CGPointMake(50, 100)];
    [bezier addQuadCurveToPoint:CGPointMake(100, 50) controlPoint:CGPointMake(50, 50)];
    bezier.lineWidth = 1.f;
    [[UIColor redColor]setStroke];
    [bezier stroke];
}


@end


























































































































