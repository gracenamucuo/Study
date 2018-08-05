//
//  DrawBezierManager.m
//  20171005-贝塞尔曲线
//
//  Created by 戴运鹏 on 2017/10/6.
//  Copyright © 2017年 戴运鹏. All rights reserved.
//

#import "DrawBezierManager.h"

@interface DrawBezierManager()
@property (nonatomic,strong)CADisplayLink *displayLink;
@property (nonatomic,assign)CGFloat progress;
@property (nonatomic,assign)CGFloat speed;
@property (nonatomic,strong)NSMutableArray *bezierPathPoints;//最终贝塞尔曲线的点的集合

@property (nonatomic,strong)NSMutableArray *subLevelPoints;//中间阶层的点的集合  二阶数组

@property (nonatomic,weak)NSArray *touchPoints;
@property (nonatomic,strong)NSMutableArray *tempBezierPathPoints;
@end

@implementation DrawBezierManager

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self inital];
    }
    return self;
}

- (void)inital {
    _subLevelPoints = [NSMutableArray array];
    _bezierPathPoints = [NSMutableArray array];
    _displayLink = [CADisplayLink displayLinkWithTarget:self selector:@selector(updateDisplayLink)];
    [_displayLink addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSRunLoopCommonModes];
    _displayLink.paused = YES;
    _progress = 0;
    _speed = 0.01;
}

- (void)cleanDataAndReloadView
{
    [self stopDrawDisplayLink];
    [_subLevelPoints removeAllObjects];
    [_bezierPathPoints removeAllObjects];
    [self updateViewDisplay];
}

- (void)startDrawDisplayLinkWithTouchPoints:(NSArray *)touchPoints
{
    _touchPoints = touchPoints;
    _progress = 0;
    _displayLink.paused = NO;
}

- (void)stopDrawDisplayLink
{
    _displayLink.paused = YES;
}

- (BOOL)drawDisplayLinkPaused
{
    return _displayLink.paused;
}

- (void)setBezierProgress:(CGFloat)progress
{
    if (_bezierPathPoints.count == 0 || !self.displayLink.paused) {
        return;
    }
    
    _progress = progress;
    _subLevelPoints = [self getAllPointsWithOriginPoints:_touchPoints progress:_progress];
//    NSInteger
}

- (NSMutableArray *)getAllPointsWithOriginPoints:(NSArray *)array progress:(CGFloat)progress
{
    return nil;
}

- (void)updateViewDisplay
{
    
}

- (void)updateDisplayLink
{
    
}

@end
















































































































































































