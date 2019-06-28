//
//  InputViewModel.m
//  T_MVVM
//
//  Created by dyp on 2019/6/28.
//  Copyright © 2019 dyp. All rights reserved.
//

#import "InputViewModel.h"
#import "Person.h"

@implementation InputViewModel

- (instancetype)initWithPerson:(Person *)person
{
    if (self = [super init]) {
        self.name = [NSString stringWithFormat:@"%@%@",person.firstName,person.lastName];
        self.age = [NSString stringWithFormat:@"%ld",person.age];
    }
    return self;
}


@end
