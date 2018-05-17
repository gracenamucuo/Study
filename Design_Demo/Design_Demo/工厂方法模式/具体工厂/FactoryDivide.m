//
//  FactoryDivide.m
//  Design_Demo
//
//  Created by 戴运鹏 on 2018/5/16.
//  Copyright © 2018年 戴运鹏. All rights reserved.
//

#import "FactoryDivide.h"
#import "FactoryMethodCalculateDivide.h"
@implementation FactoryDivide

+ (id<CalculateMethodProtocol>)factoryMethodForCalculate {
    return [[FactoryMethodCalculateDivide alloc]init];
}

@end
