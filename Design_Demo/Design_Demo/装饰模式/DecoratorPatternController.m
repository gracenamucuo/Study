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

@implementation DecoratorPatternController

- (void)viewDidLoad {
    [super viewDidLoad];
    CarTransformer *car = [[CarTransformer alloc]init];
    ConcreteFlyDecrator *flyDecrator = [[ConcreteFlyDecrator alloc]init];
    flyDecrator.transformer = car;
    [flyDecrator move];
}



@end
