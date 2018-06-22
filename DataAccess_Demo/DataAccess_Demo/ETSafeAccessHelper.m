//
//  ETSafeAccessHelper.m
//  DataAccess_Demo
//
//  Created by 戴运鹏 on 2018/6/22.
//  Copyright © 2018年 戴运鹏. All rights reserved.
//

#import "ETSafeAccessHelper.h"
#import "YYCache.h"
@interface ETSafeAccessHelper()
@property (nonatomic,strong)YYCache *cache;
@end

@implementation ETSafeAccessHelper

- (instancetype)init
{
    NSLog(@"use initWithEnv:user_ID: to create helper Instance.");
    return nil;
}

- (instancetype)initWithEnv:(NSString *)env user_ID:(NSString *)user_ID
{
    env = [env stringByReplacingOccurrencesOfString:@" " withString:@""];
    user_ID = [user_ID stringByReplacingOccurrencesOfString:@" " withString:@""];
    NSAssert1(env.length > 0, @"arg: 'env' couldn't be nil or empty%@", env);
    NSAssert1(user_ID.length > 0, @"arg: 'user_ID' couldn't be nil or empty%@", user_ID);
    NSString *cacheName = [NSString stringWithFormat:@"%@_%@",user_ID,env];
    if (self = [super init]) {
        _cache = [[YYCache alloc]initWithName:cacheName];
        _env = env;
        _user_ID = user_ID;
    }
    return self;
}
- (BOOL)containsObjectForKey:(NSString *)key
{
    return [self.cache containsObjectForKey:key];
}

- (void)setObject:(id<NSCoding>)object forKey:(NSString *)key
{
    [self.cache setObject:object forKey:key];
}

- (nullable id<NSCoding>)objectForKey:(NSString *)key
{
   return [self.cache objectForKey:key];
}

- (void)removeObjectForKey:(NSString *)key
{
    [self.cache removeObjectForKey:key];
}

- (void)removeAllObjects
{
    [self.cache removeAllObjects];
}

@end
