//
//  ViewController.m
//  20171005-贝塞尔曲线
//
//  Created by 戴运鹏 on 2017/10/5.
//  Copyright © 2017年 戴运鹏. All rights reserved.
//

#import "ViewController.h"
#import "BezierView.h"
#import "ETCountDownBtn.h"
#import "Masonry.h"
@interface ViewController ()
@property (nonatomic,strong)UILabel *label;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    self.view.backgroundColor = [UIColor whiteColor];
//
//    BezierView *view = [[BezierView alloc]init];
//
//    view.backgroundColor = [UIColor whiteColor];
//    view.frame = self.view.bounds;
//    [self.view addSubview:view];
////
//
////    ETCountDownBtn *countBtn = [[ETCountDownBtn alloc]initWithFrame:CGRectMake(50, 50, 100, 100)];
////    [self.view addSubview:countBtn];
////    [countBtn startCountDownDuration:10 skipTapBlock:^{
////
////    }];
    UILabel *label = [[UILabel alloc]init];
    label.backgroundColor = [UIColor redColor];
    [self.view addSubview:label];
    
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.equalTo(self.view).offset(50);
        make.height.width.mas_equalTo(100);
    }];
    
    self.label = label;
    UIBezierPath *b = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(0, 0, 30, 30) byRoundingCorners:UIRectCornerBottomRight | UIRectCornerTopLeft   cornerRadii:CGSizeMake(10, 10)];
    CAShapeLayer *mask = [CAShapeLayer layer];
    mask.frame = CGRectMake(0, 0, 30, 30);
    mask.path = b.CGPath;
    self.label.layer.mask = mask;
}

- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
//    UIBezierPath *b = [UIBezierPath bezierPathWithRoundedRect:self.label.bounds byRoundingCorners:UIRectCornerBottomRight | UIRectCornerTopLeft   cornerRadii:CGSizeMake(10, 10)];
//    CAShapeLayer *mask = [CAShapeLayer layer];
//    mask.frame = self.label.bounds;
//    mask.path = b.CGPath;
//   self.label.layer.mask = mask;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
