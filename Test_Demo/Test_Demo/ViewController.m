//
//  ViewController.m
//  Test_Demo
//
//  Created by 戴运鹏 on 2018/8/24.
//  Copyright © 2018年 戴运鹏. All rights reserved.
//

#import "ViewController.h"
#import "Masonry.h"
#define RADIANS_TO_DEGREES(x) ((x)/M_PI*180.0)//传入弧度 eg: M_PI_4
//角度转弧度
#define DEGREES_TO_RADIANS(x) ((x)/180.0*M_PI)//传入度数eg:45度
@interface ViewController ()
@property (nonatomic,strong)UIView *red;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIView *red = [[UIView alloc]initWithFrame:CGRectMake(20, 50, 100, 100)];
    red.backgroundColor = [UIColor redColor];
    [self.view addSubview:red];
    red.transform = CGAffineTransformMakeRotation(M_PI_4);
    self.red = red;
    
    /*
     Frame 是指当前视图（View）相对于父视图的平面坐标系统中的位置和大小。
     Bounds 是指当前视图相对于自己的平面坐标系统中的位置和大小。
     Center 是一个 CGPoint，指当前视图在父视图的平面坐标系统中最中间位置点 。
     */
    
    UIView *green = [[UIView alloc]initWithFrame:CGRectMake(-0.71067811865474084, 29.289321881345245, 141.42135623730951, 141.42135623730951)];
    green.backgroundColor = [UIColor greenColor];
    [self.view addSubview:green];
}
- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    NSLog(@"%@   %@",NSStringFromCGRect(self.red.frame),NSStringFromCGRect(self.red.bounds));
    // {{-0.71067811865474084, 29.289321881345245}, {141.42135623730951, 141.42135623730951}}   {{0, 0}, {100, 100}}
    
    NSLog(@"%@   %@",NSStringFromCGSize(self.red.bounds.size),NSStringFromCGSize(self.red.frame.size));
    
    /*总结: ⛳️⛳️⛳️
         获得某个view的size的大小的话，应该用bounds.size,避免旋转的view的产生问题。
         
         */
}



@end
