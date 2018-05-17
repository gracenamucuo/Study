//
//  UserInfoProrocol.h
//  Design_Demo
//
//  Created by 戴运鹏 on 2018/5/17.
//  Copyright © 2018年 戴运鹏. All rights reserved.
//

#import <Foundation/Foundation.h>

@class User;
@protocol UserInfoProrocol <NSObject>//也可以用抽象类来实现该抽象功能。

- (void)setUserName:(User*)name;

@end
