//
//  SqiliteFactory.m
//  Design_Demo
//
//  Created by 戴运鹏 on 2018/5/17.
//  Copyright © 2018年 戴运鹏. All rights reserved.
//

#import "SqliteFactory.h"
#import "SqliteSearchInfo.h"
#import "SqliteUserInfo.h"
#import "SqliteSettingsInfo.h"
@implementation SqliteFactory


- (id<SearchInfoProtocol>)cerateSearchInfo {
    return [[SqliteSearchInfo alloc]init];
}

- (id<SettingsInfoProtocol>)createSettingsInfo {
    return [[SqliteSettingsInfo alloc]init];
}

- (id<UserInfoProrocol>)createUserInfo {
    return [[SqliteUserInfo alloc]init];
}




@end
