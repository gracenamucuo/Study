//
//  FactoryMultiply.m
//  Design_Demo
//
//  Created by 戴运鹏 on 2018/5/16.
//  Copyright © 2018年 戴运鹏. All rights reserved.
//

#import "FactoryMultiply.h"
#import "FactoryMethodCalculateMultiply.h"
@implementation FactoryMultiply

+ (id<CalculateMethodProtocol>)factoryMethodForCalculate {
    return [[FactoryMethodCalculateMultiply alloc]init];
}

@end
