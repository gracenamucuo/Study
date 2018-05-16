//
//  FactoryAdd.m
//  Design_Demo
//
//  Created by 戴运鹏 on 2018/5/16.
//  Copyright © 2018年 戴运鹏. All rights reserved.
//

#import "FactoryAdd.h"
#import "FactoryMethodCalculateAdd.h"
@implementation FactoryAdd

+ (id<CalculateMethodProtocol>)factoryMethodForCalculate {
    return [[FactoryMethodCalculateAdd alloc]init];
}

@end
