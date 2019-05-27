//
//  ETNeworkCache.h
//  ETNetwork
//
//  Created by 戴运鹏 on 2018/3/29.
//  Copyright © 2018年 戴运鹏. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ETNeworkCache : NSObject


/**
 异步缓存网络数据，根据请求的url和parameters做Key存储数据。

 @param httpData 服务器返回的数据
 @param url      请求的Url地址
 @param parameters 请求的参数
 */
+ (void)setHttpCache:(id)httpData Url:(NSString *)url parameters:(id)parameters;


/**
 根据请求的url和parameters同步取出缓存数据

 @param Url 请求的url
 @param parameters 请求参数
 @return 缓存的数据
 */
+ (id)httpCacheForUrl:(NSString *)Url parameters:(id)parameters;

/**
    获取网络换缓存的总大小 bytes(字节)

 @return 缓存大小
 */
+ (NSInteger)getAllHttpCacheSize;


/**
 删除缓存
 */
+ (void)removeAllHttpCache;
@end
