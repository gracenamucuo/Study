//
//  DYPInteractiveTransition.h
//  CustomTransition_Demo
//
//  Created by 戴运鹏 on 2018/4/9.
//  Copyright © 2018年 戴运鹏. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^InteractiveGestureBlock)();

typedef NS_ENUM(NSUInteger,DYPInteractiveTransitionGestureDirection) {
    DYPInteractiveTransitionGestureDirection_left = 0,
    DYPInteractiveTransitionGestureDirection_right,
    DYPInteractiveTransitionGestureDirection_up,
    DYPInteractiveTransitionGestureDirection_down
};

typedef NS_ENUM(NSUInteger,DYPInteractiveTransitionType) {
    DYPInteractiveTransitionType_Present = 0,
    DYPInteractiveTransitionType_Dismiss,
    DYPInteractiveTransitionType_Push,
    DYPInteractiveTransitionType_Pop
};
///转场动画交互器
@interface DYPInteractiveTransition : UIPercentDrivenInteractiveTransition

@property (nonatomic,assign)BOOL interation;
@property (nonatomic,copy)InteractiveGestureBlock presentBlock;
@property (nonatomic,copy)InteractiveGestureBlock pushBlock;

+ (instancetype)interactionControllerWithTransitionType:(DYPInteractiveTransitionType)transitionType gestureDirection:(DYPInteractiveTransitionGestureDirection)direction;

- (instancetype)initWithTransitionType:(DYPInteractiveTransitionType)transitionType gestureDirection:(DYPInteractiveTransitionGestureDirection)direction;

- (void)addGestureOnViewController:(UIViewController *)viewController;
@end



















