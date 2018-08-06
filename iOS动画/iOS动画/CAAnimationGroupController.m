//
//  CAAnimationGroupController.m
//  iOS动画
//
//  Created by 戴运鹏 on 2017/10/2.
//  Copyright © 2017年 戴运鹏. All rights reserved.
//

#import "CAAnimationGroupController.h"

@interface CAAnimationGroupController ()

@end

@implementation CAAnimationGroupController

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
    animation.keyTimes = @[@0,@0.25,@0.5,@0.75,@1];
    animation.path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(100, 100, 100, 100)].CGPath;
    
    CABasicAnimation * animation2 = [CABasicAnimation animationWithKeyPath:@"cornerRadius"];
    animation2.toValue = @50;
    animation2.duration = 2;
    animation2.fillMode = kCAFillModeForwards;
    animation2.removedOnCompletion = NO;
    
    CAAnimationGroup * group = [CAAnimationGroup animation];
    group.duration = 2;
    group.fillMode = kCAFillModeForwards;
    group.removedOnCompletion = NO;
    group.animations = @[animation,animation2];
    
    [redView.layer addAnimation:group forKey:@"group"];
    
   //CAAnimationGroup也继承与CAAnimation，所以CAAnimationGroup是可以嵌套的。
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
