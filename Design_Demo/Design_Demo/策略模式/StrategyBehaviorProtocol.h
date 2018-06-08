//
//  StrategyBehaviorProtocol.h
//  Design_Demo
//
//  Created by 戴运鹏 on 2018/6/8.
//  Copyright © 2018年 戴运鹏. All rights reserved.
//

#import <Foundation/Foundation.h>
//抽象的策略接口
@protocol StrategyBehaviorProtocol <NSObject>

@optional
- (void)fly;
- (void)quack;
@end
