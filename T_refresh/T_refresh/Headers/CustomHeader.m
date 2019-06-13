//
//  CustomHeader.m
//  T_refresh
//
//  Created by dyp on 2019/6/12.
//  Copyright © 2019 dyp. All rights reserved.
//

#import "CustomHeader.h"
#import <Masonry.h>
@interface CustomHeader ()

@property (nonatomic,weak)UIImageView *leftDot;
@property (nonatomic,weak)UIImageView *middleDot;
@property (nonatomic,weak)UIImageView *rightDot;
@property (nonatomic,assign)MJRefreshState state;
@property (nonatomic,assign)CGFloat pullingPercent;
@end

@implementation CustomHeader

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self configUI];
    }
    return self;
}

- (void)configUI
{
    UIImageView *left = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"dot"]];
    UIImageView *middle = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"dot"]];
    UIImageView *right = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"dot"]];
    [self addSubview:left];
    [self addSubview:middle];
    [self addSubview:right];
    self.leftDot = left;
    self.middleDot = middle;
    self.rightDot = right;
    [self.leftDot mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.mas_centerX);
        make.centerY.equalTo(self.mas_centerY);
    }];
    
    [self.middleDot mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.mas_centerX);
        make.centerY.equalTo(self.mas_centerY);
    }];
    
    [self.rightDot mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.mas_centerX);
        make.centerY.equalTo(self.mas_centerY);
    }];
    
    self.state = MJRefreshStateIdle;
    [self placeImageViews];
    
    [self.leftDot addObserver:self forKeyPath:@"center" options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld context:nil];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    [self.leftDot sizeToFit];
    
    
    [self.middleDot sizeToFit];
    
    
    [self.rightDot sizeToFit];

   
}

- (void)refreshState:(MJRefreshState)state
{
    self.state = state;
    if (state == MJRefreshStateIdle) {
        if (self.pullingPercent <= 0) {
            [UIView animateWithDuration:0.25 animations:^{
                [self placeImageViews];
                self.leftDot.transform = CGAffineTransformIdentity;
                self.middleDot.transform = CGAffineTransformIdentity;
                self.rightDot.transform = CGAffineTransformIdentity;
            } completion:^(BOOL finished) {
                [self.middleDot.layer removeAllAnimations];
                [self.leftDot.layer removeAllAnimations];
                [self.rightDot.layer removeAllAnimations];
            }];
        }

    }else if (state == MJRefreshStatePulling){
        
    }else if (state == MJRefreshStateRefreshing){
        
    }
}

- (void)refreshHeaderPulling:(CGFloat)pullPercent
{
    [self animationPullPercent:pullPercent];
}


- (void)placeImageViews
{
    self.leftDot.center = self.center;
    self.middleDot.center = self.center;
    self.rightDot.center = self.center;
}

- (void)animationPullPercent:(CGFloat)pullcent
{
    self.pullingPercent = pullcent;
    NSLog(@"%@     %@",@(self.state),@(pullcent));
    
    //刷新动画
    if (self.state == MJRefreshStateRefreshing) {
        
        UIViewAnimationOptions options = UIViewAnimationOptionRepeat|UIViewAnimationOptionAutoreverse;
        
        //left
        CGPoint leftCenter = CGPointMake(CGRectGetMidX(self.leftDot.frame),CGRectGetMidY(self.leftDot.frame));
        self.leftDot.center = leftCenter;
        
        [UIView animateWithDuration:0.6 delay:0 options:options animations:^{
            self.leftDot.transform = CGAffineTransformScale(CGAffineTransformIdentity, 0.05, 0.05);
        } completion:nil];
        

        //middle
        [UIView animateWithDuration:0.6 delay:0.2 options:options animations:^{
            self.middleDot.transform = CGAffineTransformScale(CGAffineTransformIdentity, 0.05, 0.05);
        } completion:nil];

        //right
        CGPoint rightCenter = CGPointMake(CGRectGetMidX(self.rightDot.frame),CGRectGetMidY(self.rightDot.frame));
        self.rightDot.center = rightCenter;
        [UIView animateWithDuration:0.6 delay:0.4 options:options animations:^{
            self.rightDot.transform = CGAffineTransformScale(CGAffineTransformIdentity, 0.05, 0.05);
        } completion:nil];
        return;
    }
    
    //下拉动画
    CGFloat offset = (pullcent >= 1 ? 1 : pullcent) * 27.0;
//    NSLog(@"偏移量%@",@(offset));
    CGAffineTransform left = CGAffineTransformMakeTranslation(-offset, 0);
    CGAffineTransform right = CGAffineTransformMakeTranslation(offset, 0);
    
    self.leftDot.transform = left;
    self.rightDot.transform = right;
//    NSLog(@"%@",@(self.leftDot.frame));
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context
{
    if ([object isEqual:self.leftDot] && [keyPath isEqualToString:@"center"]) {
//        NSLog(@"%@",[change[@"new"] CGPointValue].x < 187.5 - 27);
//        NSLog(@"%@",@(self.leftDot.frame));
    }
}


@end
