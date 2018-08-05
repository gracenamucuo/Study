//
//  CAKeyframeAnimationController.m
//  iOS动画
//
//  Created by 戴运鹏 on 2017/10/2.
//  Copyright © 2017年 戴运鹏. All rights reserved.
//

#import "CAKeyframeAnimationController.h"

@interface CAKeyframeAnimationController ()

@end

@implementation CAKeyframeAnimationController

/*
 所以CAKeyframeAnimation也是根据属性展示动画的，他与CABasicAnimation的不同点在于他可以指定多个状态，不局限于始末状态，这样你的动画将更加灵活。
 */
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];

    UIView *redView = [[UIView alloc]initWithFrame:CGRectMake(100, 100, 100, 100)];
    redView.backgroundColor = [UIColor redColor];
    [self.view addSubview:redView];
    CAKeyframeAnimation * animation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    animation.values = @[[NSValue valueWithCGPoint:CGPointMake(0, 0)],[NSValue valueWithCGPoint:CGPointMake(100, 100)],[NSValue valueWithCGPoint:CGPointMake(0, 200)]];
    animation.duration = 2;
    animation.removedOnCompletion = NO;
    animation.fillMode = kCAFillModeForwards;
//    animation.calculationMode = kCAAnimationPaced;
    /*
calculationMode这个属性，有没有发现转折点出动作平滑了许多？恩，这个属性是用来改变补间动画的计算模式的。这个属性是CAKeyframeAnimation独有的属性。
                                                   */
    
    animation.keyTimes = @[@0,@0.25,@0.5,@0.75,@1];
    animation.path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(100, 100, 100, 100)].CGPath;
    
    //keyTimes属性指定的是当前状态节点到初始状态节点的时间占动画总时长的比例。若果不设置keyTimes则匀速播放
    //CAKeyframeAnimation还有一个独有的属性，rotationMode。这个属性的默认是一个空值nil。有两种可选值，kCAAnimationRotateAuto或者 kCAAnimationRotateAutoReverse。如果这个属性设置成以上两个值中的任意一个，当前layer都会始终保持朝向运动方向，也就是跟随运动方向自动旋转。
    
    [redView.layer addAnimation:animation forKey:@"keyframe"];
  }





































































































/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
