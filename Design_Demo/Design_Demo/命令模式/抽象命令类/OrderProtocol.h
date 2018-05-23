//
//  OrderProtocol.h
//  Design_Demo
//
//  Created by 戴运鹏 on 2018/5/23.
//  Copyright © 2018年 戴运鹏. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol OrderProtocol <NSObject>

@property(nonatomic,copy)NSString *orderString;

- (id<OrderProtocol>)initWithOrderString:(NSString*)orderString;

- (void)executeOrder;

@end
