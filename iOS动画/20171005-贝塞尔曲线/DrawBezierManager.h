//
//  DrawBezierManager.h
//  20171005-贝塞尔曲线
//
//  Created by 戴运鹏 on 2017/10/6.
//  Copyright © 2017年 戴运鹏. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

typedef void(^DrawRectBlock)(NSArray *subLevelPoints,NSArray *bezierPathPoints);
@interface DrawBezierManager : NSObject
//刷新block
@property (nonatomic,copy) DrawRectBlock drawRectBlock;

- (void)cleanDataAndReloadView;//清理数据并刷新

- (void)startDrawDisplayLinkWithTouchPoints:(NSArray *)touchPoints;

- (void)stopDrawDisplayLink;

- (BOOL)drawDisplayLinkPaused;

- (void)setBezierProgress:(CGFloat)progress;
@end








































































































