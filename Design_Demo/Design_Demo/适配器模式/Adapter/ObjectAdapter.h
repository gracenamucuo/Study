//
//  ObjectAdapter.h
//  Design_Demo
//
//  Created by 戴运鹏 on 2018/5/18.
//  Copyright © 2018年 戴运鹏. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TargetModelProtocol.h"
@class FlyModel;
@interface ObjectAdapter : NSObject<TargetModelProtocol>

- (instancetype)initWithAdaptee:(FlyModel*)fly;


@end
