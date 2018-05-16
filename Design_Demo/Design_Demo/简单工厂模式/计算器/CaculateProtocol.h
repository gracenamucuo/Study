//
//  CaculateProtocol.h
//  Design_Demo
//
//  Created by 戴运鹏 on 2018/5/16.
//  Copyright © 2018年 戴运鹏. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
//这里是用协议将具体的计算器的接口抽象出来，也可以用一个抽象类实现这样的作用。
@protocol CaculateProtocol <NSObject>

@property (nonatomic,assign)CGFloat numberA;//协议只生成了setter和getter方法  没有生成自动生成成员变量
@property (nonatomic,assign)CGFloat numberB;

- (CGFloat)calculate;

@end
