//
//  LoginViewModel.h
//  T_MVVM
//
//  Created by dyp on 2019/6/25.
//  Copyright © 2019 dyp. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface LoginViewModel : NSObject

@property (nonatomic,copy)NSString *headerImage;

@property (nonatomic,copy)NSString *phoneNumber;

@property (nonatomic,assign)BOOL loginBtnEnable;

- (BOOL)verifyPhoneNumber:(NSString *)phone;

- (void)loginSuccess:(void(^)(NSString *userID))success fail:(void(^)(NSString *failMsg))fail;

@end

NS_ASSUME_NONNULL_END
