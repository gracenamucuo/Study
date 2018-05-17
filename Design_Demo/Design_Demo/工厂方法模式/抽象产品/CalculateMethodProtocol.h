//
//  CalculateMethodProtocol.h
//  Design_Demo
//
//  Created by 戴运鹏 on 2018/5/16.
//  Copyright © 2018年 戴运鹏. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@protocol CalculateMethodProtocol <NSObject>

@property (nonatomic,assign)CGFloat numberA;//协议只生成了setter和getter方法  没有生成自动生成成员变量
@property (nonatomic,assign)CGFloat numberB;

- (CGFloat)calculate;
/*
 工厂方法模式，是一个工厂创建一种产品;需要创建多个产品的话，需要多个不同的具体工厂。在本例子中:需要加、减、乘、除四个计算器产品。需要创建四个不同的生产对应产品的工厂。
 */
@end
