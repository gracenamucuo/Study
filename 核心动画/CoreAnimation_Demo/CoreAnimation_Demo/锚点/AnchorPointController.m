//
//  AnchorPointController.m
//  CoreAnimation_Demo
//
//  Created by 戴运鹏 on 2018/4/29.
//  Copyright © 2018年 戴运鹏. All rights reserved.
//

#import "AnchorPointController.h"

@interface AnchorPointController ()

@end

@implementation AnchorPointController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

///anchorPoint  锚点
- (void)moveAnchorPoint
{
    UIView *anchorPointView = [[UIView alloc]initWithFrame:CGRectMake(50, 50, 200, 300)];
    anchorPointView.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:anchorPointView];
    NSLog(@"frame%@---bounds%@--anchorPoint%@---center%@--position%@",NSStringFromCGRect(anchorPointView.frame),NSStringFromCGRect(anchorPointView.bounds),NSStringFromCGPoint(anchorPointView.layer.anchorPoint),NSStringFromCGPoint(anchorPointView.center),NSStringFromCGPoint(anchorPointView.layer.position));
    
    anchorPointView.layer.anchorPoint = CGPointMake(0, 0);
    NSLog(@"frame%@---bounds%@--anchorPoint%@---center%@--position%@",NSStringFromCGRect(anchorPointView.frame),NSStringFromCGRect(anchorPointView.bounds),NSStringFromCGPoint(anchorPointView.layer.anchorPoint),NSStringFromCGPoint(anchorPointView.center),NSStringFromCGPoint(anchorPointView.layer.position));
    
    anchorPointView.layer.anchorPoint = CGPointMake(1, 1);
    NSLog(@"frame%@---bounds%@--anchorPoint%@---center%@--position%@",NSStringFromCGRect(anchorPointView.frame),NSStringFromCGRect(anchorPointView.bounds),NSStringFromCGPoint(anchorPointView.layer.anchorPoint),NSStringFromCGPoint(anchorPointView.center),NSStringFromCGPoint(anchorPointView.layer.position));
    /*
     2018-04-24 13:16:09.221163+0800 CoreAnimation_Demo[48116:285105] frame{{50, 50}, {200, 300}}---bounds{{0, 0}, {200, 300}}--anchorPoint{0.5, 0.5}---center{150, 200}--position{150, 200}
     2018-04-24 13:16:09.221322+0800 CoreAnimation_Demo[48116:285105] frame{{150, 200}, {200, 300}}---bounds{{0, 0}, {200, 300}}--anchorPoint{0, 0}---center{150, 200}--position{150, 200}
     2018-04-24 13:16:09.221470+0800 CoreAnimation_Demo[48116:285105] frame{{-50, -100}, {200, 300}}---bounds{{0, 0}, {200, 300}}--anchorPoint{1, 1}---center{150, 200}--position{150, 200}
     
     */
    //改变锚点会影响到frame，没有影响到center和position
    
}

@end
