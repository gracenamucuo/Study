//
//  FireEffectController.m
//  CoreAnimation_Demo
//
//  Created by 戴运鹏 on 2018/4/29.
//  Copyright © 2018年 戴运鹏. All rights reserved.
//

#import "FireEffectController.h"

@interface FireEffectController ()
@property (nonatomic,weak)UIView *contaierView;
@end

@implementation FireEffectController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
///粒子效果CAEmitterLayer
- (void)fireEffect
{
    self.contaierView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 50, 50)];
    self.contaierView.backgroundColor = [UIColor lightGrayColor];
    self.contaierView.center = self.view.center;
    [self.view addSubview:self.contaierView];
    
    CAEmitterLayer *emitter = [CAEmitterLayer layer];
    emitter.frame = self.contaierView.bounds;
    [self.contaierView.layer addSublayer:emitter];
    
    emitter.renderMode = kCAEmitterLayerAdditive;
    emitter.emitterPosition = CGPointMake(self.contaierView.frame.size.width / 2, self.contaierView.frame.size.height / 2);
    
    CAEmitterCell *cell = [[CAEmitterCell alloc]init];
    /*cell的属性一般分为三类
     1，粒子的某一属性的初始值。2，粒子某一属性的变化范围。3，指定值在时间线上的变化。
     
     */
    
    cell.contents = (__bridge id)[UIImage imageNamed:@"fire"].CGImage;
    cell.birthRate = 150;
    cell.lifetime = 5.0;
    cell.color = [UIColor colorWithRed:1 green:0.5 blue:0.1 alpha:1].CGColor;
    cell.alphaSpeed = -0.4;
    cell.velocity = 50;
    cell.velocityRange = 50;
    cell.emissionRange = M_PI * 2;
    emitter.emitterCells = @[cell];
}

@end
