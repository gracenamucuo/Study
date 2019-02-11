//
//  KVCClass.h
//  类别与扩展
//
//  Created by 戴运鹏 on 2019/2/11.
//  Copyright © 2019 戴运鹏. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "KVCModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface KVCClass : NSObject

@property (nonatomic,copy)NSString *stringA;
@property (nonatomic,strong)KVCModel *modelA;
@end

NS_ASSUME_NONNULL_END
