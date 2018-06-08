//
//  DecoratorPatternController.m
//  Design_Demo
//
//  Created by 戴运鹏 on 2018/5/17.
//  Copyright © 2018年 戴运鹏. All rights reserved.
//

#import "DecoratorPatternController.h"
#import "CarTransformer.h"
#import "ConcreteFlyDecrator.h"
#import "ConcreteTalkDecrator.h"
@interface DecoratorPatternController ()

@end
//同心圆  一层包一层，最里层是被装饰者，外层是装饰者，可以包装很多层装饰者。
//装饰者和被装饰者必须是一样的类型，必须有共同
@implementation DecoratorPatternController

- (void)viewDidLoad {
    [super viewDidLoad];
    CarTransformer *car = [[CarTransformer alloc]init];
    ConcreteFlyDecrator *flyDecrator = [[ConcreteFlyDecrator alloc]init];
    flyDecrator.transformer = car;
    [flyDecrator move];
}



@end
