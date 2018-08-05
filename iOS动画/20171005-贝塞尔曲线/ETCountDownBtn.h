//
//  ETCountDownBtn.h
//  20171005-贝塞尔曲线
//
//  Created by 戴运鹏 on 2018/4/4.
//  Copyright © 2018年 戴运鹏. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^ETCountDownSkipBlock)(void);
@interface ETCountDownBtn : UIButton

@property (nonatomic, strong) UIColor    *trackColor;
@property (nonatomic, strong) UIColor    *progressColor;
@property (nonatomic, strong) UIColor    *fillColor;
@property (nonatomic, assign) CGFloat    lineWidth;
@property (nonatomic, assign) NSInteger    animationDuration;
- (void)startCountDownDuration:(NSInteger)duration skipTapBlock:(ETCountDownSkipBlock)skipTap;

@end
