//
//  WeakProxy.h
//  Runloop_Demo
//
//  Created by 戴运鹏 on 2018/11/5.
//  Copyright © 2018 戴运鹏. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface WeakProxy : NSObject
@property (nonatomic,weak,readonly)id target;
- (instancetype)initWithTarget:(id)target;
+ (instancetype)proxyWithTarget:(id)target;
@end

NS_ASSUME_NONNULL_END
