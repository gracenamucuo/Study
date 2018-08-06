//
//  CADisplayLinkController.m
//  iOS动画
//
//  Created by 戴运鹏 on 2017/10/2.
//  Copyright © 2017年 戴运鹏. All rights reserved.
//

#import "CADisplayLinkController.h"

@interface CADisplayLinkController ()
@property (nonatomic,strong)CADisplayLink *timer;
@property (nonatomic,strong)UIImageView *imageV;
@end


//OC中的三种定时器：CADisplayLink、NSTimer、GCD
//CADisplayLink的执行频率是根据设备屏幕的刷新频率来计算的。换句话讲，他也是时间间隔最准确的定时器
@implementation CADisplayLinkController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor lightGrayColor];
    self.timer = [CADisplayLink displayLinkWithTarget:self selector:@selector(changeImage)];
    self.timer.paused = YES;
    self.timer.preferredFramesPerSecond = 2;
    
    self.imageV = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 200, 200)];
    self.imageV.contentMode = UIViewContentModeScaleAspectFill;
    self.imageV.center = self.view.center;
    [self.view addSubview:self.imageV];
    
    [self.timer addToRunLoop:[NSRunLoop currentRunLoop] forMode:NSRunLoopCommonModes];
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(0, 0, 100, 30);
    btn.center = CGPointMake(self.view.center.x, self.view.center.y + 200);
    [self.view addSubview:btn];
    [btn setTitle:@"开始播放" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(gifAction) forControlEvents:UIControlEventTouchUpInside];
    
    
}

-(void)changeImage

{
    
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
