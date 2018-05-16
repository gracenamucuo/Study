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

@end
