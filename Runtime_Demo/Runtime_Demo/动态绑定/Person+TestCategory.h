//
//  Person+TestCategory.h
//  Runtime_Demo
//
//  Created by 戴运鹏 on 2018/3/26.
//  Copyright © 2018年 戴运鹏. All rights reserved.
//

#import "Person.h"

@interface Person (TestCategory)

@property (nonatomic,copy)NSString *age;

- (void)testCategory;
@end
