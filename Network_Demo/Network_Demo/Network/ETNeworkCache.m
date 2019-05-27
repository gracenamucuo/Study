//
//  ETNeworkCache.m
//  ETNetwork
//
//  Created by 戴运鹏 on 2018/3/29.
//  Copyright © 2018年 戴运鹏. All rights reserved.
//

#import "ETNeworkCache.h"
#import "YYCache.h"

static NSString *const kETNetWorkResponseCache = @"kETNetWorkResponseCache";

@implementation ETNeworkCache

static YYCache *_dataCache;
+ (void)initialize
{
    _dataCache = [YYCache cacheWithName:kETNetWorkResponseCache];
}

+ (void)setHttpCache:(id)httpData Url:(NSString *)url parameters:(id)parameters
{
 //异步缓存，不阻塞主线程
    NSString *cacheKey = [self cacheKeyWithUrl:url parameters:parameters];
    [_dataCache setObject:httpData forKey:cacheKey];
}

+ (id)httpCacheForUrl:(NSString *)Url parameters:(id)parameters
{
    NSString *cacheKey = [self cacheKeyWithUrl:Url parameters:parameters];
    return [_dataCache objectForKey:cacheKey];
}

+ (NSInteger)getAllHttpCacheSize
{
    return [_dataCache.diskCache totalCost];
}

+ (void)removeAllHttpCache
{
    [_dataCache.diskCache removeAllObjects];
}

+ (NSString *)cacheKeyWithUrl:(NSString *)url parameters:(NSDictionary *)parameters
{
    if (!parameters || parameters.count == 0) {
        return url;
    }
    //将参数字典转换成字符串
    NSData *stringData = [NSJSONSerialization dataWithJSONObject:parameters options:0 error:nil];
    NSString *paraString = [[NSString alloc]initWithData:stringData encoding:NSUTF8StringEncoding];
    //url拼接参数
    return [NSString stringWithFormat:@"%@%@",url,paraString];
    
}

@end
