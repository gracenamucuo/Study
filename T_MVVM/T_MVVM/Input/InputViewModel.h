//
//  InputViewModel.h
//  T_MVVM
//
//  Created by dyp on 2019/6/28.
//  Copyright © 2019 dyp. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Person;
NS_ASSUME_NONNULL_BEGIN

@interface InputViewModel : NSObject

@property (nonatomic,copy)NSString *name;
@property (nonatomic,copy)NSString *age;
- (instancetype)initWithPerson:(Person *)person;
@end

NS_ASSUME_NONNULL_END
