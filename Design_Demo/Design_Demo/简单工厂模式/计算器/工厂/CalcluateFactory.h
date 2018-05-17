//
//  CalcluateFactory.h
//  Design_Demo
//
//  Created by 戴运鹏 on 2018/5/16.
//  Copyright © 2018年 戴运鹏. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Constant.h"
#import "CaculateProtocol.h"
@interface CalcluateFactory : NSObject

+ (id<CaculateProtocol>)createCalculate:(NSString*)calculateType;
/*
 简单工厂模式是只有具体工厂，没有抽象工厂，具体工厂根据不同的类型判断生产出具体的产品。具体的产品调用抽象产品的接口来实现各自具体的功能。
 */
@end
