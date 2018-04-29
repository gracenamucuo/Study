//
//  FlatLayerController.m
//  CoreAnimation_Demo
//
//  Created by 戴运鹏 on 2018/4/29.
//  Copyright © 2018年 戴运鹏. All rights reserved.
//

#import "FlatLayerController.h"

@interface FlatLayerController ()

@end

@implementation FlatLayerController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

///扁平化图层  子视图按照和父视图相反的方向旋转后，相互抵消
- (void)flatLayer
{
    UIView *outterView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 150, 150)];
    outterView.backgroundColor = [UIColor redColor];
    outterView.center = self.view.center;
    [self.view addSubview:outterView];
    
    UILabel *innerLabel = [[UILabel alloc]init];
    innerLabel.frame = CGRectMake(35, 35, 80, 80);
    innerLabel.text = @"内视图";
    innerLabel.textAlignment = NSTextAlignmentCenter;
    innerLabel.backgroundColor = [UIColor blueColor];
    [outterView addSubview:innerLabel];
    
    //   错误 innerLabel.center = outterView.center;//这里的center的值是相对于父视图的坐标的，这样的话，是没有在外部视图的中心的。
    
    //=========绕z轴旋转
    //    CATransform3D outer = CATransform3DMakeRotation(M_PI_4, 0, 0, 1);//z轴旋转，效果相当于在平面上旋转。
    //    outterView.layer.transform = outer;
    //    //抵消
    //    CATransform3D inner = CATransform3DMakeRotation(-M_PI_4, 0, 0, 1);
    //    innerLabel.layer.transform = inner;
    
    //=========背面
    //    CATransform3D back = CATransform3DMakeRotation(M_PI, 0, 1, 0);//x轴是从上下看，y轴是从左右看，z轴就是平视。
    //    innerLabel.layer.transform = back;
    //    innerLabel.layer.doubleSided = NO;//只有正面绘制。
    
    //=========3D旋转
    //    CATransform3D outer = CATransform3DIdentity;
    //    outer.m34 = -1 / 500.0;
    //    outer = CATransform3DRotate(outer, M_PI_4, 0, 1, 0);
    //    outterView.layer.transform = outer;
    //
    //    CATransform3D inner = CATransform3DIdentity;
    //    inner.m34 = -1/500;
    //    inner = CATransform3DRotate(inner, -M_PI_4, 0, 1, 0);
    //    innerLabel.layer.transform = inner;
    
}


@end
