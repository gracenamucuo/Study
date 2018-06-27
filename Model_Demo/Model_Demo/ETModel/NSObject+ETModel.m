//
//  NSObject+ETModel.m
//  Model_Demo
//
//  Created by 戴运鹏 on 2018/6/27.
//  Copyright © 2018年 戴运鹏. All rights reserved.
//

#import "NSObject+ETModel.h"
#import "YYModel.h"
@implementation NSObject (ETModel)

+ (nullable instancetype)et_modelWithJSON:(id)json
{
   return [self  yy_modelWithJSON:json];
}

+ (nullable instancetype)et_modelWithDictionary:(NSDictionary *)dictionary
{
    return [self yy_modelWithDictionary:dictionary];
}

- (BOOL)et_modelSetWithJson:(id)json
{
    return [self yy_modelSetWithJSON:json];
}

- (BOOL)et_modelSetWithDictionary:(NSDictionary *)dic
{
    return [self yy_modelSetWithDictionary:dic];
}

- (nullable id)et_modelToJSONObject
{
    return [self yy_modelToJSONObject];
}

- (NSData *)et_modelToJSONData
{
    return [self yy_modelToJSONData];
}

- (NSString *)et_modelToJSONString
{
    return [self yy_modelToJSONString];
}

- (nullable id)et_modelCopy
{
    return [self yy_modelCopy];
}

- (void)et_modelEncodeWithCoder:(NSCoder *)aCoder
{
    [self yy_modelInitWithCoder:aCoder];
}

- (id)et_modelInitWithCoder:(NSCoder *)aDecoder
{
    return [self yy_modelInitWithCoder:aDecoder];
}

- (BOOL)et_modelIsEqual:(id)model
{
    return [self yy_modelIsEqual:model];
}

- (NSString *)et_modelDescription
{
    return [self yy_modelDescription];
}

@end

@implementation NSArray (ETModel)

+ (nullable NSArray *)et_modelArrayWithClass:(Class)cls json:(id)json
{
    return [self yy_modelArrayWithClass:cls json:json];
}

@end

@implementation NSDictionary (ETModel)

+ (nullable NSDictionary *)et_modelDictionaryWithClass:(Class)cls json:(id)json
{
    return [self yy_modelDictionaryWithClass:cls json:json];
}

@end


