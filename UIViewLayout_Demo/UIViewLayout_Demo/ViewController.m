//
//  ViewController.m
//  UIViewLayout_Demo
//
//  Created by 戴运鹏 on 2018/7/12.
//  Copyright © 2018年 戴运鹏. All rights reserved.
//

#import "ViewController.h"
#import "TestView.h"
@interface ViewController ()
@property (nonatomic,strong)TestView *t;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    TestView *t = [[TestView alloc]initWithFrame:CGRectMake(0, 0, 100, 100)];//如果不将view加到其他view上，默认不会调用layoutSubviews  如果写了layoutIfNeeded 会调用layoutSubviews
//    [t setNeedsLayout];//该方法不会立即调用layoutSubviews，需要配合layoutIfNeeded或者直接用layoutIfNeeded调用layoutSubviews
//    [t layoutIfNeeded];
    
    t.backgroundColor = [UIColor redColor];
//    [self.view addSubview:t];//调用两次 layoutSubviews
    self.t = t;
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [super touchesBegan:touches withEvent:event];

    
    UILabel *label = [[UILabel alloc]init];
    label.text = @"123";
    label.frame = CGRectMake(0, 0, 50,50);
    [self.t addSubview:label];

    
    
    
//    t.frame = CGRectMake(10, 10, 100, 100);
}




@end
