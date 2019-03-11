//
//  DrawVCViewController.m
//  渲染
//
//  Created by 戴运鹏 on 2019/2/27.
//  Copyright © 2019 戴运鹏. All rights reserved.
//

#import "DrawVCViewController.h"
#import "DrawView.h"


@interface DrawVCViewController ()
@property (nonatomic,weak)DrawView *draw;
@end

@implementation DrawVCViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    DrawView *draw = [[DrawView alloc]initWithFrame:CGRectMake(100, 100, 50, 50)];
    [self.view addSubview:draw];
    self.draw = draw;
//    NSLog(@"%@",draw);
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [super touchesBegan:touches withEvent:event];
    self.draw.bounds = CGRectMake(0, 0, 100, 100);
}

@end
