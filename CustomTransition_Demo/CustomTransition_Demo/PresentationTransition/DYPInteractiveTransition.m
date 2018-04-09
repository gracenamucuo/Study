//
//  DYPInteractiveTransition.m
//  CustomTransition_Demo
//
//  Created by 戴运鹏 on 2018/4/9.
//  Copyright © 2018年 戴运鹏. All rights reserved.
//

#import "DYPInteractiveTransition.h"

@interface DYPInteractiveTransition ()

@property (nonatomic,assign)DYPInteractiveTransitionType type;
@property (nonatomic,assign)DYPInteractiveTransitionGestureDirection direction;
@property (nonatomic,weak)UIViewController *vc;

@end

@implementation DYPInteractiveTransition

+ (instancetype)interactionControllerWithTransitionType:(DYPInteractiveTransitionType)transitionType gestureDirection:(DYPInteractiveTransitionGestureDirection)direction
{
    
    return [[self alloc] initWithTransitionType:transitionType gestureDirection:direction];
}

- (instancetype)initWithTransitionType:(DYPInteractiveTransitionType)transitionType gestureDirection:(DYPInteractiveTransitionGestureDirection)direction
{
    if (self = [super init]) {
        _type = transitionType;
        _direction = direction;
    }
    return self;
}

- (void)addGestureOnViewController:(UIViewController *)viewController
{
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(handleGesture:)];
    self.vc = viewController;
    [viewController.view addGestureRecognizer:pan];
}


///手势进行过程
- (void)handleGesture:(UIPanGestureRecognizer *)pan
{
    CGFloat percent = 0;
    switch (_direction) {
        case DYPInteractiveTransitionGestureDirection_left:
        {
            CGFloat transitionX = -[pan translationInView:pan.view].x;
            percent = transitionX / pan.view.frame.size.width;
            break;
        }
        case DYPInteractiveTransitionGestureDirection_right:
        {
            CGFloat transitionX = [pan translationInView:pan.view].x;
            percent = transitionX / pan.view.frame.size.width;
          break;
        }
        case DYPInteractiveTransitionGestureDirection_up:
        {
            CGFloat transitionY = -[pan translationInView:pan.view].y;
            percent = transitionY / pan.view.frame.size.width;
            break;
        }
        case DYPInteractiveTransitionGestureDirection_down:
        {
            CGFloat transitionY = [pan translationInView:pan.view].y;
            percent = transitionY / pan.view.frame.size.width;
            break;
        }
        default:
            break;
    }
    
    switch (pan.state) {
        case UIGestureRecognizerStateBegan:
        {
            self.interation = YES;
            [self startGesture];
            break;
        }
        case UIGestureRecognizerStateChanged:
        {
            [self updateInteractiveTransition:percent];
            break;
        }
        case UIGestureRecognizerStateEnded:
        {
            self.interation = NO;
            if (percent > 0.5) {
                [self finishInteractiveTransition];
            }else{
                [self cancelInteractiveTransition];
            }
            break;
        }
        default:
            break;
    }
    
}

- (void)startGesture
{
    switch (self.type) {
        case DYPInteractiveTransitionType_Present:
        {
            if (self.presentBlock) {
                self.presentBlock();
            }
            break;
        }
        case DYPInteractiveTransitionType_Dismiss:
            [self.vc dismissViewControllerAnimated:YES completion:nil];
            break;
        case DYPInteractiveTransitionType_Push:
        {
            if (self.pushBlock) {
                self.pushBlock();
            }
            break;
        }
        case DYPInteractiveTransitionType_Pop:
            [self.vc.navigationController popViewControllerAnimated:YES];
            break;

        default:
            break;
    }
}
@end























