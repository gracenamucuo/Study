//
//  ModelTrasitionAnimator.h
//  CustomTransition_Demo
//
//  Created by 戴运鹏 on 2018/4/8.
//  Copyright © 2018年 戴运鹏. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger,DYPModelTransitionType) {
    DYPModelTransitionTypePresent = 0,
    DYPModelTransitionTypeDismiss
};

/**
 遵循UIViewControllerAnimatedTransitioning协议，实现其中的方法，专为模态跳转自定义的动画器。
 */
@interface ModelTrasitionAnimator : NSObject<UIViewControllerAnimatedTransitioning>

+ (instancetype)modelTransitionAnimatorWithTransitionType:(DYPModelTransitionType)transitionType;
- (instancetype)initWithModelTransitionType:(DYPModelTransitionType)transitionType;

@end













