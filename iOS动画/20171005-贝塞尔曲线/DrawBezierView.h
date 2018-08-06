//
//  DrawBezierView.h
//  20171005-贝塞尔曲线
//
//  Created by 戴运鹏 on 2017/10/6.
//  Copyright © 2017年 戴运鹏. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DrawBezierView : UIView

/**
 速度
 */
@property (nonatomic,assign)CGFloat speed;

- (void)updatePointNum:(NSInteger)pointNum;

- (void)setBezierProgress:(CGFloat)progress;
@end

























