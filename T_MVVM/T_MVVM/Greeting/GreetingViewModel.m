//
//  GreetingViewModel.m
//  T_MVVM
//
//  Created by dyp on 2019/6/17.
//  Copyright © 2019 dyp. All rights reserved.
//

#import "GreetingViewModel.h"
#import "Person.h"
@interface GreetingViewModel ()
@property (nonatomic,strong)Person *person;

@end

@implementation GreetingViewModel

@synthesize greeting = _greeting;
@synthesize greetingDidChange = _greetingDidChange;

- (NSString *)greeting
{
    
    return _greeting;
}

- (void)setGreeting:(NSString *)greeting
{
    _greeting = greeting;
    if (self.greetingDidChange) {
        self.greetingDidChange(self);
    }
}

- (void)setGreetingDidChange:(GreetingModelBlock)greetingDidChange
{
    _greetingDidChange = greetingDidChange;
    
}

- (instancetype)initWithPerson:(nonnull Person *)person {
    if (self = [super init]) {
        self.person = person;
    }
    return self;
}

- (void)showGreeting:(NSString *)greeting
{
    self.greeting = [NSString stringWithFormat:@"hello + %@ %@",self.person.firstName,self.person.lastName];
}

@end
