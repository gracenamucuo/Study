//
//  Person+WeakAssociated.h
//  Knowledge_Demo
//
//  Created by 戴运鹏 on 2019/1/25.
//  Copyright © 2019 戴运鹏. All rights reserved.
//

#import "Person.h"
#import "Son.h"
NS_ASSUME_NONNULL_BEGIN

@interface Person (WeakAssociated)
@property (nonatomic,copy)Son *weakSon;
@end

NS_ASSUME_NONNULL_END
