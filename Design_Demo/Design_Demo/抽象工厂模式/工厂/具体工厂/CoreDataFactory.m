//
//  CoreDataFactory.m
//  Design_Demo
//
//  Created by 戴运鹏 on 2018/5/17.
//  Copyright © 2018年 戴运鹏. All rights reserved.
//

#import "CoreDataFactory.h"

#import "CoreDataSearchInfo.h"
#import "CoreDataUserInfo.h"
#import "CoreDataSettingsInfo.h"
@implementation CoreDataFactory

- (id<SearchInfoProtocol>)cerateSearchInfo {
    return [[CoreDataSearchInfo alloc]init];
}

- (id<SettingsInfoProtocol>)createSettingsInfo {
    return [[CoreDataSettingsInfo alloc]init];
}

- (id<UserInfoProrocol>)createUserInfo {
    return [[CoreDataUserInfo alloc]init];
}

@end
