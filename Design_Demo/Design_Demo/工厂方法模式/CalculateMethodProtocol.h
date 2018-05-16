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

@end
