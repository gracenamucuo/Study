//
//  FactoryProtocol.h
//  Design_Demo
//
//  Created by 戴运鹏 on 2018/5/17.
//  Copyright © 2018年 戴运鹏. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UserInfoProrocol.h"
#import "SearchInfoProtocol.h"
#import "SettingsInfoProtocol.h"
@protocol FactoryProtocol <NSObject>

- (id<UserInfoProrocol>)createUserInfo;
- (id<SearchInfoProtocol>)cerateSearchInfo;
- (id<SettingsInfoProtocol>)createSettingsInfo;

/*
 抽象工厂模式是一个工厂可以生产一系列产品(属于某个产品族的一系列产品:该例子中分为sqlite和CoreData的两个系列产品)。工厂和和产品的抽象可以用抽象基类也可以用协议实现。
 具体工厂(Sqlite工厂和coreData工厂)来调用抽象的接口(createUserInfo; cerateSearchInfo;createSettingsInfo)生产出对应的具体产品(SqliteUserInfo;SqliteSearchInfo;SqliteSettingsInfo)。具体产品调用抽象的产品接口，实现具体产品的效果。
 */
@end
