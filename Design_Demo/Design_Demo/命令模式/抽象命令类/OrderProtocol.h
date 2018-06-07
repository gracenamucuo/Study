//
//  OrderProtocol.h
//  Design_Demo
//
//  Created by 戴运鹏 on 2018/5/23.
//  Copyright © 2018年 戴运鹏. All rights reserved.
//

#import <Foundation/Foundation.h>

///命令模式可将“动作的请求者”从“动作的执行者”对象中解耦。

//命令的调用者waiter和命令的执行者 完全解耦，命令类里有一个执行者的实例。

///命令创建者 Customer  命令调用者(将命令收集和执行) Waiter 命令执行者 Worker

/*
 命令创建者:  顾客(Customer)
 命令调用者:  女服务员(Invoker)
 命令执行者:  厨师(Reciver)
 命令:       订单(Command)
 orderUp:   命令执行:execute()
 takeOrder: 收集命令(setCommand)
 */
@protocol OrderProtocol <NSObject>

@property(nonatomic,copy)NSString *orderString;

- (id<OrderProtocol>)initWithOrderString:(NSString*)orderString;

- (void)executeOrder;

@end
