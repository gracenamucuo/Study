//
//  TimerAnimationController.m
//  CoreAnimation_Demo
//
//  Created by 戴运鹏 on 2018/5/2.
//  Copyright © 2018年 戴运鹏. All rights reserved.
//

#import "TimerAnimationController.h"
#import "Constant.h"
@interface TimerAnimationController ()
@property (nonatomic,strong)UIImageView *ballImageView;
@property (nonatomic,assign)CFTimeInterval duration;
@property (nonatomic,strong)CADisplayLink *timer;
@property (nonatomic,assign)CFTimeInterval timeOffset;
@property (nonatomic,assign)CFTimeInterval lastStep;
@property (nonatomic,strong)id fromValue;
@property (nonatomic,strong)id toValue;
@end

@implementation TimerAnimationController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self creatBallFallAnimation];
}

- (void)creatBallFallAnimation
{
    CALayer *containerLayer = [CALayer layer];
    containerLayer.frame = CGRectMake(0, 0, 350, 450);
    containerLayer.position = self.view.center;
    [self.view.layer addSublayer:containerLayer];
    containerLayer.backgroundColor = [UIColor lightGrayColor].CGColor;
    
    UIImage *ball = [UIImage imageNamed:@"ball"];
    UIImageView *imageView = [[UIImageView alloc]initWithImage:ball];
    self.ballImageView = imageView;
    [self.view addSubview:imageView];
    
    self.duration = 1;
    self.timeOffset = 0;
    self.fromValue = [NSValue valueWithCGPoint:CGPointMake(150, 32)];
    self.toValue = [NSValue valueWithCGPoint:CGPointMake(150, 268)];
    
    [self.timer invalidate];
    self.lastStep = CACurrentMediaTime();
    self.timer = [CADisplayLink displayLinkWithTarget:self selector:@selector(step:)];
    [self.timer addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSDefaultRunLoopMode];
    
}

- (void)step:(CADisplayLink *)timer
{
    CFTimeInterval thisStep = CACurrentMediaTime();
    CFTimeInterval stepDuration = thisStep - self.lastStep;
    self.lastStep = thisStep;
    
    self.timeOffset = MIN(self.timeOffset + stepDuration, self.duration);
    float time = self.timeOffset / self.duration;
    time = bounceEaseOut(time);
    id position = [self interpolateFromValue:self.fromValue toValue:self.toValue time:time];
    self.ballImageView.center = [position CGPointValue];
    
    if (self.timeOffset >= self.duration) {
        [self.timer invalidate];
        self.timer = nil;
    }
}

- (id)interpolateFromValue:(id)fromValue toValue:(id)toValue time:(float)time
{
    if ([fromValue isKindOfClass:[NSValue class]]) {
        const char *type = [fromValue objCType];
        if (strcmp(type, @encode(CGPoint)) == 0) {
            CGPoint from = [fromValue CGPointValue];
            CGPoint to = [toValue CGPointValue];
            CGPoint result = CGPointMake(interpolate(from.x, to.x, time), interpolate(from.y, to.y, time));
            return [NSValue valueWithCGPoint:result];
        }
    }
    return (time < 0.5) ? fromValue : toValue;
}
@end










































