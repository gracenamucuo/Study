//
//  ModelTrasitionAnimator.m
//  CustomTransition_Demo
//
//  Created by 戴运鹏 on 2018/4/8.
//  Copyright © 2018年 戴运鹏. All rights reserved.
//

#import "ModelTrasitionAnimator.h"

@interface ModelTrasitionAnimator()
@property (nonatomic,assign)DYPModelTransitionType transitionType;
@end

@implementation ModelTrasitionAnimator

#pragma mark -- 初始化
+ (instancetype)modelTransitionAnimatorWithTransitionType:(DYPModelTransitionType)transitionType
{
    return [[self alloc]initWithModelTransitionType:transitionType];
}

- (instancetype)initWithModelTransitionType:(DYPModelTransitionType)transitionType
{
    if (self = [super init]) {
        _transitionType = transitionType;
    }
    return self;
}

#pragma mark -- UIViewControllerAnimatedTransitioning代理方法


/**
 返回转场动画执行时间

 @param transitionContext 转场上下文 提供转场过程中两个控制器，已经containerView和两个控制器的view
 @return 时间
 */
- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext
{
    return 0.3f;//可以将presentation和dismiss设置不同的时间
}


/**
 核心方法，动画的执行过程在这个方法里实现

 @param transitionContext 上下文
 */
- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext
{
    switch (self.transitionType) {
        case DYPModelTransitionTypePresent:
        {
            [self performPresentAnimationWithContext:transitionContext];
            break;
        }
         case DYPModelTransitionTypeDismiss:
        {
            [self performDismissAnimationWithContext:transitionContext];
            break;
        }
        default:
            break;
    }
}

#pragma mark -- 生成动画

//在这里，如果presentingVC被nav持有或者不持有的话，fromVC会不同，但是最终动画的效果是一样的，都可以按照fromVC就是presentingvc的思路来处理动画、
- (void)performPresentAnimationWithContext:(id<UIViewControllerContextTransitioning>)transitionContext
{
    //可以通过上下文取出转场涉及到的两个控制器，以及两个控制器的view
    //fromVC就是presentingVC
    UIViewController *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    //是否使用手势
    //转场结束，containerView会将fromVC.view移除，所以要想在转场结束后，仍然看到fromVC.view，用截图方法
    UIView *captureView = [fromVC.view snapshotViewAfterScreenUpdates:NO];
    captureView.frame = fromVC.view.frame;
    fromVC.view.hidden = YES;
    //转场过程中的容器view。两个控制器的view都加在这个view中，然后通过移动其坐标，实现转场
    UIView *containerView = [transitionContext containerView];
    //在模态Presentation中，fromVC.view是已经加在containerView上的。但是toVC.view需要我们手动加，如果用fromVC.view的截图替代fromVC.view的话，在这里也要手动加到containerView上。
    [containerView addSubview:captureView];
    [containerView addSubview:toVC.view];
    
    toVC.view.frame = CGRectMake(0, containerView.frame.size.height, containerView.frame.size.width, 500);
    [UIView animateWithDuration:[self transitionDuration:transitionContext] delay:0 usingSpringWithDamping:0.55 initialSpringVelocity:1/0.44 options:0 animations:^{
        //将toVC.view从containerview的下边移动到能见范围内
        toVC.view.transform = CGAffineTransformMakeTranslation(0, -500);
        captureView.transform = CGAffineTransformMakeScale(0.9, 0.9);
        
    } completion:^(BOOL finished) {
        //转场结束后，要将结果告诉UIKit
        [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
        if ([transitionContext transitionWasCancelled]) {
            fromVC.view.hidden = NO;
            [captureView removeFromSuperview];
        }
    }];
    
}

- (void)performDismissAnimationWithContext:(id<UIViewControllerContextTransitioning>)transitionContext
{
    //被presentation出来的控制器
    UIViewController *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIView *containerView = [transitionContext containerView];
    NSArray *subviewsArray = containerView.subviews;
    UIView *captureView = subviewsArray[MIN(subviewsArray.count, MAX(0, subviewsArray.count - 2))];

    [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
        //因为present的时候都是使用的transform，这里的动画只需要将transform恢复就可以了
        fromVC.view.transform = CGAffineTransformIdentity;
        captureView.transform = CGAffineTransformIdentity;
    } completion:^(BOOL finished) {
        if ([transitionContext transitionWasCancelled]) {
            //失败了接标记失败
            [transitionContext completeTransition:NO];
        }else{
            //如果成功了，我们需要标记成功，同时让toVC显示出来，然后移除截图视图，
            [transitionContext completeTransition:YES];
            toVC.view.hidden = NO;
            
            [captureView removeFromSuperview];
        }
    }];
}
@end




























