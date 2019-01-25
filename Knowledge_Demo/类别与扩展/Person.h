//
//  Person.h
//  类别与扩展
//
//  Created by 戴运鹏 on 2019/1/25.
//  Copyright © 2019 戴运鹏. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Person : NSObject
@property (atomic,copy)NSString *sex;
- (void)originalMethod;

@end

NS_ASSUME_NONNULL_END
