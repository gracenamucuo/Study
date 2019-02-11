//
//  Person+PropertyCategory.h
//  类别与扩展
//
//  Created by 戴运鹏 on 2019/1/25.
//  Copyright © 2019 戴运鹏. All rights reserved.
//

#import "Person.h"
#import "Son.h"
NS_ASSUME_NONNULL_BEGIN

@interface Person (PropertyCategory)

@property (nonatomic,copy)NSString *nameNoRuntime;
@property (nonatomic,copy)NSString *nameWithRuntime;
@property (nonatomic,strong)Son *associateSon;
- (void)testInstanceVar;
@end

NS_ASSUME_NONNULL_END
