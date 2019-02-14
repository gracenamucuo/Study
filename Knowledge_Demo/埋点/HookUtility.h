//
//  HookUtility.h
//  埋点
//
//  Created by 戴运鹏 on 2019/2/14.
//  Copyright © 2019 戴运鹏. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface HookUtility : NSObject
+ (void)swizzlingInClass:(Class)cls originalSelector:(SEL)originalSelector swizzledSelector:(SEL)swizzledSelector;
@end

NS_ASSUME_NONNULL_END
