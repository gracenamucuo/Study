//
//  ETSafeAccessHelper.h
//  DataPersistence_Demo
//
//  Created by 戴运鹏 on 2018/6/21.
//  Copyright © 2018年 戴运鹏. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ETSafeAccessHelper : NSObject

/**
 初始化

 @param env 当前环境
 @param user_ID 账号的user_ID
 @return 存储实例
 */
- (instancetype)initWithEnv:(NSString *)env user_ID:(NSString *)user_ID;


/**
 存储值

 @param object 要存储的对象需要遵循<NSCoding>协议，容器类中元素也都要遵循
 @param key 键值
 */
- (void)setObject:(nullable id<NSCoding>)object forKey:(NSString *)key;

/**
 取值

 @param key 键值
 @return 存的值
 */
- (nullable id<NSCoding>)objectForKey:(NSString *)key;

/**
 清空该账号该环境的所有存储
 */
- (void)removeAllObjects;
@end
