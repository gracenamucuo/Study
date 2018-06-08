//
//  StrategyPatternController.m
//  Design_Demo
//
//  Created by 戴运鹏 on 2018/6/8.
//  Copyright © 2018年 戴运鹏. All rights reserved.
//

#import "StrategyPatternController.h"
#import "RedDuck.h"
#import "GreenDuck.h"
#import "ConcreteFlyBehavior.h"
#import "ConcreteQuackBehavior.h"
@interface StrategyPatternController ()

@end
//策略模式
//定义了算法族，分别封装起来，让它们之间可以相互替换，此模式让算法的变化独立于使用算法的客户。
//eg:可以将🦆的飞行行为和叫的行为共同抽出一个接口，不同的具体类实现不同的行为(飞行或叫，不同的飞行，不同的叫)。当一个🦆类原来有一个飞行行为，现在不要飞行行为了，改成一个叫的行为，这样，只有在创建这个鸭子的时候，传入一个具体的叫的行为的类，就可以满足。而不需要改变鸭子类的代码。
@implementation StrategyPatternController

- (void)viewDidLoad {
    [super viewDidLoad];
    RedDuck *red = [[RedDuck alloc]initWithBehavior:[[ConcreteFlyBehavior alloc]init]];
    [red display];
    
    GreenDuck *green  = [[GreenDuck alloc]initWithBehavior:[[ConcreteQuackBehavior alloc]init]];
    [green display];
}

@end
