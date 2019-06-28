//
//  Person.h
//  T_MVVM
//
//  Created by dyp on 2019/6/17.
//  Copyright © 2019 dyp. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Person : NSObject

@property (nonatomic,copy)NSString *firstName;
@property (nonatomic,copy)NSString *lastName;
@property (nonatomic,assign)NSUInteger age;

@end

NS_ASSUME_NONNULL_END
