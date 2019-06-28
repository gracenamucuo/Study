//
//  LoginViewModel.m
//  T_MVVM
//
//  Created by dyp on 2019/6/25.
//  Copyright © 2019 dyp. All rights reserved.
//

#import "LoginViewModel.h"

@interface LoginViewModel ()

@end

@implementation LoginViewModel

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.headerImage = @"mvvm";
    }
    return self;
}

- (BOOL)loginBtnEnable
{
    return self.phoneNumber.length == 11;
}

- (BOOL)verifyPhoneNumber:(NSString *)phone
{
    if (phone.length == 11) {
        return YES;
    }
    
    return NO;
}

- (void)loginSuccess:(void (^)(NSString * _Nonnull))success fail:(void (^)(NSString * _Nonnull))fail
{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        success(@"123");
    });
}

- (void)dealloc
{
    NSLog(@"%@ ------销毁",[self class]);
}
@end
