//
//  AnimationController.m
//  CustomTransition_Demo
//
//  Created by 戴运鹏 on 2018/4/5.
//  Copyright © 2018年 戴运鹏. All rights reserved.
//

#import "AnimationController.h"
#import <UIKit/UIKit.h>
@interface AnimationController()<UIViewControllerAnimatedTransitioning>

@end

@implementation AnimationController

//返回动画时间
- (NSTimeInterval)transitionDuration:(nullable id <UIViewControllerContextTransitioning>)transitionContext
{
    return 0.3;
}

//自定义动画的核心逻辑 动画的流程在这个方法
- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext
{
    //transitionContext 转场上下文 可以通过转场上下文来获取fromVC和toVC等相关信息
    //transitionContext是在转场过程中才会出现的，每个代理方法里都有转场上下文可以获取，所以直接从代理方法中拿即可。
    UIView *containerView = transitionContext.containerView;
    
      UIViewController *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIView *fromView = [transitionContext viewForKey:UITransitionContextFromViewKey];
  
    UIViewController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIView *toView = [transitionContext viewForKey:UITransitionContextToViewKey];
    
    CGFloat translation = containerView.frame.size.width;
    CGAffineTransform fromTransfrom = CGAffineTransformIdentity;
    CGAffineTransform toTransfrom = CGAffineTransformIdentity;
    [containerView addSubview:toView];
    
    if (self.isPresent) {
        toTransfrom = CGAffineTransformTranslate(toTransfrom, translation, 0);
        fromTransfrom = CGAffineTransformTranslate(fromTransfrom, -translation, 0);
    }else{
        toTransfrom = CGAffineTransformTranslate(toTransfrom, -translation, 0);
        fromTransfrom = CGAffineTransformTranslate(fromTransfrom, translation, 0);
    }

    toView.transform = toTransfrom;
    [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
        fromView.transform = fromTransfrom;
        toView.transform = CGAffineTransformIdentity;
    } completion:^(BOOL finished) {
        fromView.transform = CGAffineTransformIdentity;
        toView.transform = CGAffineTransformIdentity;
        [transitionContext completeTransition:!transitionContext.transitionWasCancelled];
    }];
    
}

- (id <UIViewImplicitlyAnimating>) interruptibleAnimatorForTransition:(id <UIViewControllerContextTransitioning>)transitionContext
{
    return nil;
}

//转场结束时
- (void)animationEnded:(BOOL) transitionCompleted
{
    
}


@end



































