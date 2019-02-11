//
//  KVOClassA.h
//  类别与扩展
//
//  Created by 戴运鹏 on 2019/2/11.
//  Copyright © 2019 戴运鹏. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <objc/runtime.h>
NS_ASSUME_NONNULL_BEGIN

@interface KVOClassA : NSObject

@property (nonatomic,assign)NSUInteger value;
@property (nonatomic,assign)IMP imp;
@property (nonatomic,assign)IMP classImp;

@end

NS_ASSUME_NONNULL_END
