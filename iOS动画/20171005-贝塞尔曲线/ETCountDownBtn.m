//
//  ETCountDownBtn.m
//  20171005-贝塞尔曲线
//
//  Created by 戴运鹏 on 2018/4/4.
//  Copyright © 2018年 戴运鹏. All rights reserved.
//

#import "ETCountDownBtn.h"
#define degreesToRadians(x) ((x) * M_PI / 180.0)

@interface ETCountDownBtn()<CAAnimationDelegate>
// 底部进度条圈
@property (nonatomic, strong) CAShapeLayer *trackLayer;
// 表层进度条圈
@property (nonatomic, strong) CAShapeLayer *progressLayer;
@property (nonatomic, strong) UIBezierPath *bezierPath;
@property (nonatomic, copy)   ETCountDownSkipBlock tapBlock;

@end

@implementation ETCountDownBtn

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self == [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor clearColor];
        
        [self.layer addSublayer:self.trackLayer];
        
    }
    return self;
}

- (UIBezierPath *)bezierPath {
    if (!_bezierPath) {
        
        CGFloat width = CGRectGetWidth(self.frame)/2.0f;
        CGFloat height = CGRectGetHeight(self.frame)/2.0f;
        CGPoint centerPoint = CGPointMake(width, height);
        float radius = CGRectGetWidth(self.frame)/2;
        
        _bezierPath = [UIBezierPath bezierPathWithArcCenter:centerPoint
                                                     radius:radius
                                                 startAngle:degreesToRadians(-90)
                                                   endAngle:degreesToRadians(270)
                                                  clockwise:YES];
    }
    return _bezierPath;
}

- (CAShapeLayer *)trackLayer {
    if (!_trackLayer) {
        _trackLayer = [CAShapeLayer layer];
        _trackLayer.frame = self.bounds;
        // 圈内填充色
        _trackLayer.fillColor = self.fillColor.CGColor ? self.fillColor.CGColor : [UIColor clearColor].CGColor ;
        _trackLayer.lineWidth = self.lineWidth ? self.lineWidth : 2.f;
        // 底部圈色
        _trackLayer.strokeColor = self.trackColor.CGColor ? self.trackColor.CGColor : [UIColor colorWithRed:197/255.0 green:159/255.0 blue:82/255.0 alpha:0.3].CGColor ;
        _trackLayer.strokeStart = 0.f;
        _trackLayer.strokeEnd = 1.f;
        
        _trackLayer.path = self.bezierPath.CGPath;
    }
    return _trackLayer;
}

- (CAShapeLayer *)progressLayer {
    
    if (!_progressLayer) {
        _progressLayer = [CAShapeLayer layer];
        _progressLayer.frame = self.bounds;
        _progressLayer.fillColor = [UIColor clearColor].CGColor;
        _progressLayer.lineWidth = self.lineWidth ? self.lineWidth : 2.f;
        _progressLayer.lineCap = kCALineCapRound;
        // 进度条圈进度色
        _progressLayer.strokeColor = self.progressColor.CGColor ? self.progressColor.CGColor  : [UIColor  colorWithRed:197/255.0 green:159/255.0 blue:82/255.0 alpha:1].CGColor;
        _progressLayer.strokeStart = 0.f;
        
        CABasicAnimation *pathAnimation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
        pathAnimation.duration = self.animationDuration;
        pathAnimation.fromValue = @(0.0);
        pathAnimation.toValue = @(1.0);
        pathAnimation.removedOnCompletion = YES;
        pathAnimation.delegate = self;
        [_progressLayer addAnimation:pathAnimation forKey:nil];
        
        _progressLayer.path = _bezierPath.CGPath;
    }
    return _progressLayer;
}

- (void)startCountDownDuration:(NSInteger)duration skipTapBlock:(ETCountDownSkipBlock)skipTap
{
    
    self.tapBlock = skipTap;
    self.animationDuration = duration;
    [self setTitleCountDown];
    [self.layer addSublayer:self.progressLayer];
}

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag
{
    if (flag) {
        self.tapBlock();
    }
    
}
- (void)setTitleCountDown
{
    
    __block NSInteger timeOut= self.animationDuration; //倒计时时间
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_source_t _timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0,queue);
    dispatch_source_set_timer(_timer,dispatch_walltime(NULL, 0),1.0*NSEC_PER_SEC, 0); //每秒执行
    dispatch_source_set_event_handler(_timer, ^{
        if(timeOut<=0){ //倒计时结束，关闭
            dispatch_source_cancel(_timer);
            dispatch_async(dispatch_get_main_queue(), ^{
                //设置界面的按钮显示 根据自己需求设置
                [self setTitle:@"跳过" forState:UIControlStateNormal];
                [self setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
                self.tapBlock();
                self.userInteractionEnabled = YES;
            });
        }else{
            //            int minutes = timeout / 60;
            int seconds = (int)timeOut % (self.animationDuration+1);
            NSString *strTime = [NSString stringWithFormat:@"%.2d", seconds];
            dispatch_async(dispatch_get_main_queue(), ^{
                //设置界面的按钮显示 根据自己需求设置
                [self setTitle:[NSString stringWithFormat:@"%@%@",strTime,@"s跳过"] forState:UIControlStateNormal];
                [self setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
                self.userInteractionEnabled = YES;
                
            });
           timeOut--;
            
        }
    });
    dispatch_resume(_timer);
    
}

@end


























