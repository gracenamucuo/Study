//
//  ETSafeAccessHelper.m
//  DataPersistence_Demo
//
//  Created by 戴运鹏 on 2018/6/21.
//  Copyright © 2018年 戴运鹏. All rights reserved.
//

#import "ETSafeAccessHelper.h"
#import "YYCache.h"
@interface ETSafeAccessHelper()
@property (nonatomic,strong)YYCache *cache;
@end
static NSString *userID = @"userId";
static NSString *currentEnv = @"currentEnv";
@implementation ETSafeAccessHelper

- (instancetype)initWithEnv:(NSString *)env user_ID:(NSString *)user_ID
{
    if (self = [super init]) {
        
    }
    return self;
}

- (void)setObject:(id<NSCoding>)object forKey:(NSString *)key
{
    [self.cache setObject:object forKey:key];
}
- (nullable id<NSCoding>)objectForKey:(NSString *)key
{
    return [self.cache objectForKey:key];
}
- (void)removeAllObjects
{
    [self.cache removeAllObjects];
}
@end





