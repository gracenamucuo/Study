//
//  CABasicAnimationController.m
//  iOS动画
//
//  Created by 戴运鹏 on 2017/10/2.
//  Copyright © 2017年 戴运鹏. All rights reserved.
//

#import "CABasicAnimationController.h"

@interface CABasicAnimationController ()

@end

@implementation CABasicAnimationController

/*
 CABasicAnimation用来创建基于两个状态的动画，你只需要给出两个状态，一个初始状态一个终止状态，系统自动为你将中间的动画补全
 
 
 //fillMode 属性
 kCAFillModeForwards//保持结束时状态
 kCAFillModeBackwards//保持开始时状态
 kCAFillModeBoth//保持两者，我没懂两者是什么概念，实际使用中与kCAFillModeBackwards相同
 kCAFillModeRemoved//移除
 
 
 
 timingFunction属性
 kCAMediaTimingFunctionLinear//线性节奏，就是匀速
 kCAMediaTimingFunctionEaseIn//淡入，缓慢加速进入，然后匀速
 kCAMediaTimingFunctionEaseOut//淡出，匀速，然后缓慢减速移除
 kCAMediaTimingFunctionEaseInEaseOut//淡入淡出，结合以上两者
 kCAMediaTimingFunctionDefault//默认效果

 
 delegate，代理。设置代理以后就会执行代理方法啦。
 
 -(void)animationDidStart:(CAAnimation *)anim;
 
 -(void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag;
 
 
 */

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIView *redView = [[UIView alloc]initWithFrame:CGRectMake(100, 100, 100, 100)];
    redView.backgroundColor = [UIColor redColor];
    [self.view addSubview:redView];
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"position"];
    animation.removedOnCompletion = NO;
    animation.fillMode = kCAFillModeForwards;
    animation.duration = 2;
    animation.beginTime = CACurrentMediaTime() + 2;
    animation.repeatCount = MAXFLOAT;
    animation.toValue = [NSValue valueWithCGPoint:CGPointMake(400, 400)];
    /*
     from就是指定初始状态
     toValue就是终止状态
     by就是状态的增量
     这三个值呢，不能全为空，以为这样你就一个状态也没有指定。
     
     也不能全不为空，因为这样你就指定了三个状态，系统也不知道选哪两个。
     */
    [redView.layer addAnimation:animation forKey:nil];
}





























/*
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 /*
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 /*
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 /*
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 /*
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 /*
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 /*
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 /*
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 /*
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 /*
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 /*
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 /*
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 /*
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 /*
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 /*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
