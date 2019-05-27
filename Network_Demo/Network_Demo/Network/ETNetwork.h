//
//  ETNetwork.h
//  ETNetwork
//
//  Created by 戴运鹏 on 2018/3/29.
//  Copyright © 2018年 戴运鹏. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
typedef NS_ENUM(NSUInteger,ETNetworkStatusType){
    ///未知网络
    ETNetworkStatusUnknown,
    ///无网络
    ETNetworkStatusNotReachable,
    ///手机蜂窝网络
    ETNetworkStatusReachableViaWWAN,
    ///WIFI网络
    ETNetworkStatusReachableViaWIFI
};

///请求数据格式
typedef NS_ENUM(NSUInteger, ETRequestSerializer) {
    /// 设置请求数据为JSON格式
    ETRequestSerializerJSON,
    /// 设置请求数据为二进制格式
    ETRequestSerializerHTTP,
};

///响应数据格式
typedef NS_ENUM(NSUInteger, ETResponseSerializer) {
    /// 设置响应数据为JSON格式
    ETResponseSerializerJSON,
    /// 设置响应数据为二进制格式
    ETResponseSerializerHTTP,
};

///请求成功block
typedef void(^ETHttpRequestSuccess)(id responseObject);

///请求失败的block
typedef void(^ETHttpRequestFailed)(NSError *error);

///缓存block
typedef void(^ETHttpRequestCache)(id responseCache);

///上传或下载的进度
typedef void(^ETHttpProgress)(NSProgress *progress);

///网络状态block
typedef void(^ETNetwokrStatus)(ETNetworkStatusType status);

@class AFHTTPSessionManager;

@interface ETNetwork : NSObject

///是否有网络
+ (BOOL)isNetwork;

///是否是手机网络
+ (BOOL)isWWANetwork;

///是否是Wifi
+ (BOOL)isWiFiNetwork;

///取消所有请求
+ (void)cancelAllRequest;

///实时获取网络状态
+ (void)networkStatusWithBlock:(ETNetwokrStatus)networkStatus;


/**
 取消指定Url的请求

 @param url 要取消的请求的url
 */
+ (void)cancelRequestWithUrl:(NSString *)url;

///打开日志
+ (void)openLog;

///关闭日志
+ (void)closeLog;


/**
 GET请求  无缓存

 @param url         请求的地址
 @param parameters  请求参数
 @param success     请求成功的回调
 @param failure     请求失败的回调
 @return 返回的请求的任务task，可以通过cacel方法取消请求
 */
+ (__kindof NSURLSessionTask *)getWithUrl:(NSString *)url parameters:(id)parameters success:(ETHttpRequestSuccess)success failure:(ETHttpRequestFailed)failure;


/**
 GET请求 有缓存

 @param url             请求地址
 @param parameters      请求参数
 @param responseCache   缓存数据的回调
 @param success         请求成功的回调
 @param failure         请求失败的回调
 @return 返回的请求的任务task，可以通过cacel方法取消请求
 */
+ (__kindof NSURLSessionTask *)getWithUrl:(NSString *)url parameters:(id)parameters responseCache:(ETHttpRequestCache)responseCache success:(ETHttpRequestSuccess)success failure:(ETHttpRequestFailed)failure;


/**
 POST请求 无缓存

 @param Url         请求地址
 @param parameters  请求参数
 @param success     请求成功的回调
 @param failure     请求失败的回调
 @return 返回的请求的任务task，可以通过cacel方法取消请求
 */
+ (__kindof NSURLSessionTask *)postWithUrl:(NSString *)Url parameters:(id)parameters success:(ETHttpRequestSuccess)success failure:(ETHttpRequestFailed)failure;


/**
 POST请求 有缓存

 @param url            请求地址
 @param parameters     请求参数
 @param responseCache  缓存数据的回调
 @param success        请求成功的回调
 @param failure        请求失败的回调
 @return 返回的请求的任务task，可以通过cacel方法取消请求
 */
+ (__kindof NSURLSessionTask *)postWithUrl:(NSString *)url parameters:(id)parameters responseCache:(ETHttpRequestCache)responseCache success:(ETHttpRequestSuccess)success failure:(ETHttpRequestFailed)failure;



/**
 上传文件

 @param url         请求地址
 @param parameters  请求参数
 @param name        文件对应服务器上的字段
 @param filePath    文件本地的沙盒路径
 @param progress    上传进度信息
 @param success     请求成功的回调
 @param failure     请求失败的回调
 @return 返回的请求的任务task，可以通过cacel方法取消请求
 */
+ (__kindof NSURLSessionTask *)uploadFileWithUrl:(NSString *)url parameters:(NSString *)parameters name:(NSString *)name filePath:(NSString *)filePath progress:(ETHttpProgress)progress success:(ETHttpRequestSuccess)success failure:(ETHttpRequestFailed)failure;


/**
 上传单张图片

 @param url         请求地址
 @param parameters  请求参数
 @param name        图片对应服务器上的字段
 @param image       图片
 @param fileName    图片文件名
 @param imageScale  图片文件压缩比 范围(0.f ~ 1.f)
 @param imageType   图片文件的类型 eg:png,jpg(默认)
 @param progress    上传进度信息
 @param success     请求成功的回调
 @param failure     请求失败的回调
 @return 返回的请求的任务task，可以通过cacel方法取消请求
 */
+ (__kindof NSURLSessionTask *)uploadSingleImageWithUrl:(NSString *)url parameters:(id)parameters name:(NSString *)name image:(UIImage *)image fileName:(NSString *)fileName imageScale:(CGFloat)imageScale imageType:(NSString *)imageType progress:(ETHttpProgress)progress success:(ETHttpRequestSuccess)success failure:(ETHttpRequestFailed)failure;

/**
 上传单张/多张图片

 @param url         请求地址
 @param parameters  请求参数
 @param name        图片对应服务器上的字段
 @param images      图片数组
 @param fileNames   图片文件名数组，可以为nil，数组内的文件名默认为当前日期时间"yyyyMMddHHmmss"
 @param imageScale  图片文件压缩比 范围(0.f ~ 1.f)
 @param imageType   图片文件的类型 eg:png,jpg(默认)
 @param progress    上传进度信息
 @param success     请求成功的回调
 @param failure     请求失败的回调
 @return 返回的请求的任务task，可以通过cacel方法取消请求
 */
+ (__kindof NSURLSessionTask *)uploadImagesWithUrl:(NSString *)url parameters:(id)parameters name:(NSString *)name images:(NSArray<UIImage*> *)images fileNames:(NSArray<NSString *>*)fileNames imageScale:(CGFloat)imageScale imageType:(NSString *)imageType progress:(ETHttpProgress)progress success:(ETHttpRequestSuccess)success failure:(ETHttpRequestFailed)failure;


/**
 下载文件

 @param url 请求地址
 @param fileDir 文件存储目录(默认存储目录为Download)
 @param progress 文件的下载进度信息
 @param sucess 下载成功的回调(回调参数filePath:文件的路径)
 @param failure 下载失败的回调
 @return 返回的NSURLSessionDownloadTask实例，可用于暂停继续，暂停调用suspend方法，开始下载调用resume方法
 */
+ (__kindof NSURLSessionTask *)downloadWithUrl:(NSString *)url fileDir:(NSString *)fileDir progress:(ETHttpProgress)progress success:(void(^)(NSString *filePath))sucess failure:(ETHttpRequestFailed)failure;



#pragma mark -- 设置AFHTTPSessionManager相关属性


/**
 设置AFHTTPSessionManager的相关属性

 @param sessionManager AFHTTPSessionManager的实例
 */
+ (void)setSFHTTPSessionManagerProperty:(void(^)(AFHTTPSessionManager *sessionManager))sessionManager;


/**
 设置网络请求参数的格式:默认是二进制格式

 @param requestSerializer ETRequestSerializerJSON(JSON格式)，ETRequestSerializerHTTP(二进制格式)
 */
+ (void)setRequestSerializer:(ETRequestSerializer)requestSerializer;

+ (void)setResponseSerizlizer:(ETResponseSerializer)responseSerializer;

+ (void)setRequestTimeoutInterval:(NSTimeInterval)time;

+ (void)setValue:(NSString *)value forHTTPHeaderField:(NSString *)field;

+ (void)openNetworkActivityIndicator:(BOOL)open;

+ (void)setSecurityPolicyWithCerPath:(NSString *)cerPath validatesDomainName:(BOOL)validatesDomainName;
@end









































