//
//  Model.h
//  内存
//
//  Created by 戴运鹏 on 2019/2/12.
//  Copyright © 2019 戴运鹏. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Model : NSObject
@property (nonatomic,assign)NSInteger age;
@property (nonatomic,assign)NSInteger sex;
@property (nonatomic,copy)NSString *name;
- (void)testInstanceMethod;
+ (void)testClassMethod;
@end

NS_ASSUME_NONNULL_END
