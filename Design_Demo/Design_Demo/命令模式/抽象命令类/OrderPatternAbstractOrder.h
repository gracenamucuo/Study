//
//  OrderPatternAbstractOrder.h
//  Design_Demo
//
//  Created by 戴运鹏 on 2018/5/23.
//  Copyright © 2018年 戴运鹏. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface OrderPatternAbstractOrder : NSObject
@property(nonatomic,copy)NSString *orderString;

- (instancetype)initWithOrderString:(NSString*)orderString;

- (void)executeOrder;
@end
