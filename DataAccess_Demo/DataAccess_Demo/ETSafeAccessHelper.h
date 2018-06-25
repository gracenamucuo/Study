//
//  ETSafeAccessHelper.h
//  DataAccess_Demo
//
//  Created by 戴运鹏 on 2018/6/22.
//  Copyright © 2018年 戴运鹏. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ETSafeAccessHelper : NSObject

@property (nonatomic,copy,readonly)NSString *env;
@property (nonatomic,copy,readonly)NSString *user_ID;
/**
 初始化实例

 @param env 当前服务器环境
 @param user_ID 用户账号id
 @return 实例
 */
- (instancetype)initWithEnv:(NSString *)env user_ID:(NSString *)user_ID;
- (instancetype)init UNAVAILABLE_ATTRIBUTE;

/**
 给出的key是否有对应value

 @param key 给出的key
 @return 缓存中是否有该key
 */
- (BOOL)containsObjectForKey:(NSString *)key;
/**
 存值

 @param object 遵循<NSCoding>协议的对象
 @param key 键值
 */
- (void)setObject:(nullable id<NSCoding>)object forKey:(NSString *)key;

/**
 取值

 @param key 键值
 @return 指定键值对应的value
 */
- (nullable id<NSCoding>)objectForKey:(NSString *)key;

/**
 清除指定key对应的value

 @param key 清除的key
 */
- (void)removeObjectForKey:(NSString *)key;

/**
 清空当前缓存
 */
- (void)removeAllObjects;


/**
 删除当前缓存文件夹
 */
- (void)deleteFile;
@end
