//
//  CalcluateFactory.m
//  Design_Demo
//
//  Created by 戴运鹏 on 2018/5/16.
//  Copyright © 2018年 戴运鹏. All rights reserved.
//

#import "CalcluateFactory.h"
#import "CalculateAdd.h"
#import "CalculateMinus.h"
#import "CalculateMultiply.h"
#import "CalculateDivide.h"
@implementation CalcluateFactory

+ (id<CaculateProtocol>)createCalculate:(NSString *)calculateType
{
    NSArray *calculateArray = @[@"+",@"-",@"*",@"/"];
    CalculateType type = [calculateArray indexOfObject:calculateType];
    switch (type) {
        case CalculateType_Add:
            NSLog(@"%ld",CalculateType_Add);
            return [[CalculateAdd alloc]init];
            break;
        case CalculateType_Minus:
            NSLog(@"%ld",CalculateType_Minus);
            return [[CalculateMinus alloc]init];
            break;
        case CalculateType_Multipy:
            NSLog(@"%ld",CalculateType_Multipy);
            return [[CalculateMultiply alloc]init];
            break;
        case CalculateType_Divide:
            NSLog(@"%ld",CalculateType_Divide);
            return [[CalculateDivide alloc]init];
            break;
        default:
            return nil;
            break;
    }
}

@end
