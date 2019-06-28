//
//  GreetingViewModelProtocol.h
//  T_MVVM
//
//  Created by dyp on 2019/6/17.
//  Copyright © 2019 dyp. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Person;
NS_ASSUME_NONNULL_BEGIN
@protocol GreetingViewModelProtocol <NSObject>

typedef void(^GreetingModelBlock)(id<GreetingViewModelProtocol> viewModel);

@property (nonatomic,copy,readonly)NSString *greeting;
@property (nonatomic,copy)GreetingModelBlock greetingDidChange;

- (instancetype)initWithPerson:(Person *)person;
- (void)showGreeting:(NSString *)greeting;

@end

NS_ASSUME_NONNULL_END
