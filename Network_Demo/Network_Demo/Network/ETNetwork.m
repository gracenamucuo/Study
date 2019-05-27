//
//  ETNetwork.m
//  ETNetwork
//
//  Created by 戴运鹏 on 2018/3/29.
//  Copyright © 2018年 戴运鹏. All rights reserved.
//

#import "ETNetwork.h"
#import "AFNetworking.h"
#import "AFNetworkActivityIndicatorManager.h"
#import "ETNeworkCache.h"
#ifdef DEBUG
#define ETLog( s, ... ) printf("class: <%p %s:(%d) > method: %s \n%s\n", self, [[[NSString stringWithUTF8String:__FILE__] lastPathComponent] UTF8String], __LINE__, __PRETTY_FUNCTION__, [[NSString stringWithFormat:(s), ##__VA_ARGS__] UTF8String] )
#else
#define ETLog( s, ... )
#endif

#define NSStringFormat(format,...) [NSString stringWithFormat:format,##__VA_ARGS__]


@implementation ETNetwork

static BOOL _isOPenLog;
static NSMutableArray *_allSessionTasks;
static AFHTTPSessionManager *_sessionManager;

+ (void)networkStatusWithBlock:(ETNetwokrStatus)networkStatus
{
    [[AFNetworkReachabilityManager sharedManager] setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        switch (status) {
            case AFNetworkReachabilityStatusUnknown:
            {
                networkStatus ? networkStatus(ETNetworkStatusUnknown):nil;
                if (_isOPenLog) {
                    ETLog(@"未知网络");
                }
                break;
            }
            case AFNetworkReachabilityStatusNotReachable:
            {
                networkStatus ? networkStatus(ETNetworkStatusNotReachable) : nil;
                if (_isOPenLog) {
                    ETLog(@"无网络");
                }
                break;
            }
            case AFNetworkReachabilityStatusReachableViaWiFi:
            {
                networkStatus ? networkStatus(ETNetworkStatusReachableViaWIFI) : nil;
                if (_isOPenLog) {
                    ETLog(@"WIFI");
                }
                break;
            }
            case AFNetworkReachabilityStatusReachableViaWWAN:
            {
                networkStatus ? networkStatus(ETNetworkStatusReachableViaWWAN) : nil;
                if (_isOPenLog) {
                    ETLog(@"手机网络");
                }
                break;
            }
            default:
                break;
        }
    }];
}

+ (BOOL)isNetwork
{
    return [AFNetworkReachabilityManager sharedManager].reachable;
}

+ (BOOL)isWWANetwork
{
    return [AFNetworkReachabilityManager sharedManager].reachableViaWWAN;
}

+ (BOOL)isWiFiNetwork
{
    return [AFNetworkReachabilityManager sharedManager].reachableViaWiFi;
}

+ (void)openLog
{
    _isOPenLog = YES;
}

+ (void)closeLog
{
    _isOPenLog  = NO;
}

+ (void)cancelAllRequest
{
    @synchronized(self){
        [[self allSessionTasks]enumerateObjectsUsingBlock:^(NSURLSessionTask  *_Nonnull task, NSUInteger idx, BOOL * _Nonnull stop) {
            [task cancel];
        }];
        [[self allSessionTasks] removeAllObjects];
    }
}

+ (void)cancelRequestWithUrl:(NSString *)url
{
    if (!url) {
        return;
    }
    
    @synchronized(self){
        [[self allSessionTasks]enumerateObjectsUsingBlock:^(NSURLSessionTask  *_Nonnull task, NSUInteger idx, BOOL * _Nonnull stop) {
            if ([task.currentRequest.URL.absoluteString hasPrefix:url]) {
                [task cancel];
                [[self allSessionTasks]removeObject:task];
                *stop = YES;
            }
        }];
    }
}

#pragma mark --GET请求无缓存
+ (__kindof NSURLSessionTask*)getWithUrl:(NSString *)url parameters:(id)parameters success:(ETHttpRequestSuccess)success failure:(ETHttpRequestFailed)failure
{
    return [self getWithUrl:url parameters:parameters responseCache:nil success:success failure:failure];
}

#pragma mark --POST请求无缓存
+ (__kindof NSURLSessionTask *)postWithUrl:(NSString *)Url parameters:(id)parameters success:(ETHttpRequestSuccess)success failure:(ETHttpRequestFailed)failure
{
    return [self postWithUrl:Url parameters:parameters responseCache:nil success:success failure:failure];
}

#pragma mark --GET请求有缓存
+ (__kindof NSURLSessionTask *)getWithUrl:(NSString *)url parameters:(id)parameters responseCache:(ETHttpRequestCache)responseCache success:(ETHttpRequestSuccess)success failure:(ETHttpRequestFailed)failure
{
    //读取缓存
    responseCache != nil ? responseCache([ETNeworkCache httpCacheForUrl:url parameters:parameters]) : nil;
    NSURLSessionTask *sessionTask = [_sessionManager GET:url parameters:parameters progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (_isOPenLog) {
            ETLog(@"responseObject = %@",responseObject);
        }
        
        [[self allSessionTasks]removeObject:task];
        success ? success(responseObject) : nil;
        //异步缓存数据
        responseObject != nil ? [ETNeworkCache setHttpCache:responseObject Url:url parameters:parameters] : nil;
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (_isOPenLog) {
            ETLog(@"error = %@",error);
            [[self allSessionTasks]removeObject:task];
            failure ? failure(error) : nil;
        }
    }];
    //添加到sesssionTask到数组
    sessionTask ? [[self allSessionTasks] addObject:sessionTask] : nil;
    return sessionTask;
}

#pragma mark -- POST请求有缓存
+ (__kindof NSURLSessionTask *)postWithUrl:(NSString *)url parameters:(id)parameters responseCache:(ETHttpRequestCache)responseCache success:(ETHttpRequestSuccess)success failure:(ETHttpRequestFailed)failure
{
    //读取缓存
    responseCache != nil ? responseCache([ETNeworkCache httpCacheForUrl:url parameters:parameters]) : nil;
    NSURLSessionTask *sessionTask = [_sessionManager POST:url parameters:parameters progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (_isOPenLog) {
            ETLog(@"responseObject = %@",responseObject);
        }
        [[self allSessionTasks]removeObject:task];
        success ? success(responseObject) : nil;
        //异步缓存数据
        responseCache != nil ? [ETNeworkCache setHttpCache:responseObject Url:url parameters:parameters] : nil;
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (_isOPenLog) {
            ETLog(@"error = %@",error);
        }
        [[self allSessionTasks]removeObject:task];
        failure ? failure(error) : nil;
    }];
    
    sessionTask ? [[self allSessionTasks]addObject:sessionTask] : nil;
    return sessionTask;
}

#pragma mark -- 上传文件
+ (__kindof NSURLSessionTask *)uploadFileWithUrl:(NSString *)url parameters:(NSString *)parameters name:(NSString *)name filePath:(NSString *)filePath progress:(ETHttpProgress)progress success:(ETHttpRequestSuccess)success failure:(ETHttpRequestFailed)failure
{
    NSURLSessionTask *sessionTask = [_sessionManager POST:url parameters:parameters constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        NSError *error = nil;
        [formData appendPartWithFileURL:[NSURL URLWithString:filePath] name:name error:&error];
        (failure && error) ? failure(error) : nil;
    } progress:^(NSProgress * _Nonnull uploadProgress) {
        //上传进度
        dispatch_sync(dispatch_get_main_queue(), ^{//为什么同步？
            progress ? progress(uploadProgress) : nil;
        });
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (_isOPenLog) {
            ETLog(@"responseObject = %@",responseObject);
        }
        [[self allSessionTasks]removeObject:task];
        success ? success(responseObject) : nil;
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (_isOPenLog) {
            ETLog(@"error = %@",error);
        }
        [[self allSessionTasks]removeObject:task];
        failure ? failure(error) : nil;
    }];
    
    sessionTask ? [[self allSessionTasks]addObject:sessionTask]: nil;
    return sessionTask;
}

#pragma mark -- 上传单张图片
+ (__kindof NSURLSessionTask *)uploadSingleImageWithUrl:(NSString *)url parameters:(id)parameters name:(NSString *)name image:(UIImage *)image fileName:(NSString *)fileName imageScale:(CGFloat)imageScale imageType:(NSString *)imageType progress:(ETHttpProgress)progress success:(ETHttpRequestSuccess)success failure:(ETHttpRequestFailed)failure
{
    return  [self uploadImagesWithUrl:url parameters:parameters name:name images:@[image] fileNames:fileName != nil ? @[fileName]:nil imageScale:imageScale imageType:imageType progress:progress success:success failure:failure];
}

#pragma mark -- 上传多张图片
+ (__kindof NSURLSessionTask *)uploadImagesWithUrl:(NSString *)url parameters:(id)parameters name:(NSString *)name images:(NSArray<UIImage *> *)images fileNames:(NSArray<NSString *> *)fileNames imageScale:(CGFloat)imageScale imageType:(NSString *)imageType progress:(ETHttpProgress)progress success:(ETHttpRequestSuccess)success failure:(ETHttpRequestFailed)failure
{
    NSURLSessionTask *sessionTask = [_sessionManager POST:url parameters:parameters constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        
        for (NSInteger i = 0; i < images.count; i++) {
            //图片二进制文件
            NSData *imageData = UIImageJPEGRepresentation(images[i], imageScale ?: 1.f);
            //生成默认图片文件名称，当filenNames为nil时使用
            NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
            formatter.dateFormat = @"yyyyMMddHHmmss";
            NSString *str = [formatter stringFromDate:[NSDate date]];
            NSString *imageFileName = NSStringFormat(@"%@%ld.%@",str,i,imageType?:@"jpg");
            [formData appendPartWithFileData:imageData name:name fileName:(fileNames.count > 0) ? NSStringFormat(@"%@.%@",fileNames[i],imageType?:@"jpg"):imageFileName mimeType:NSStringFormat(@"image/%@",imageType?:@"jpg")];
        }
        
    } progress:^(NSProgress * _Nonnull uploadProgress) {
        dispatch_sync(dispatch_get_main_queue(), ^{
            progress ? progress(uploadProgress):nil;
        });
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (_isOPenLog) {
            ETLog(@"responseObject = %@",responseObject);
        }
        [[self allSessionTasks]removeObject:task];
        success ? success(responseObject):nil;
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (_isOPenLog) {
            ETLog(@"error = %@",error);
        }
        [[self allSessionTasks]removeObject:task];
        failure ? failure(error) : nil;
    }];
    
    
    sessionTask ? [[self allSessionTasks]addObject:sessionTask] : nil;
    return sessionTask;
}

#pragma mark -- 下载文件
+ (__kindof NSURLSessionTask *)downloadWithUrl:(NSString *)url fileDir:(NSString *)fileDir progress:(ETHttpProgress)progress success:(void (^)(NSString *))sucess failure:(ETHttpRequestFailed)failure
{
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:url]];
    __block NSURLSessionDownloadTask *downloadTask = [_sessionManager downloadTaskWithRequest:request progress:^(NSProgress * _Nonnull downloadProgress) {
        dispatch_sync(dispatch_get_main_queue(), ^{
            progress ? progress(downloadProgress) : nil;
        });
    } destination:^NSURL * _Nonnull(NSURL * _Nonnull targetPath, NSURLResponse * _Nonnull response) {
    //拼接缓存目录
NSString *downloadDir = [[NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject]stringByAppendingPathComponent:fileDir? fileDir:@"Download"];
        //打开文件管理器
        NSFileManager *fileManager = [NSFileManager defaultManager];
        //创建Download目录
        [fileManager createDirectoryAtPath:downloadDir withIntermediateDirectories:YES attributes:nil error:nil];
        //拼接文件路径
        NSString *filePath = [downloadDir stringByAppendingPathComponent:response.suggestedFilename];
        //返回文件位置的url路径
        return [NSURL fileURLWithPath:filePath];
        
    } completionHandler:^(NSURLResponse * _Nonnull response, NSURL * _Nullable filePath, NSError * _Nullable error) {
        [[self allSessionTasks] removeObject:downloadTask];
        if (failure && error) {
            failure(error);
            return ;
        }
        sucess ? sucess(filePath.absoluteString):nil;
    }];
    
    //开始下载
    [downloadTask resume];
    downloadTask ? [[self allSessionTasks]addObject:downloadTask] : nil;
    return downloadTask;
}

+ (NSMutableArray *)allSessionTasks
{
    if (!_allSessionTasks) {
        _allSessionTasks = [NSMutableArray array];
    }
    return _allSessionTasks;
}

#pragma mark --初始化AFHTTPSessionManager相关属性

/**
 开始监测网路
 */
+ (void)load
{
    [[AFNetworkReachabilityManager sharedManager] startMonitoring];
}


/**
 所有请求都共用一个AFHTTPSessionManager
 
 */
+ (void)initialize
{
    _sessionManager = [AFHTTPSessionManager manager];
    _sessionManager.requestSerializer.timeoutInterval = 30.f;
    _sessionManager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/html", @"text/json", @"text/plain", @"text/javascript", @"text/xml", @"image/*", nil];
    //状态栏信号旁边的小菊花
    [AFNetworkActivityIndicatorManager sharedManager].enabled = YES;
}

#pragma mark --重置AFHTTPSessionManager相关属性
+ (void)setResponseSerizlizer:(ETResponseSerializer)responseSerializer
{
     _sessionManager.responseSerializer = responseSerializer== ETResponseSerializerHTTP ? [AFHTTPResponseSerializer serializer] : [AFJSONResponseSerializer serializer];
}

@end



















































