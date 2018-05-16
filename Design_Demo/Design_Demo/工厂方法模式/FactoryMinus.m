//
//  FactoryMinus.m
//  Design_Demo
//
//  Created by 戴运鹏 on 2018/5/16.
//  Copyright © 2018年 戴运鹏. All rights reserved.
//

#import "FactoryMinus.h"
#import "FactoryMethodCalculateMinus.h"
@implementation FactoryMinus

+ (id<CalculateMethodProtocol>)factoryMethodForCalculate {
    return [[FactoryMethodCalculateMinus alloc]init];
}

@end
