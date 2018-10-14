//
//  FileHelper.m
//  TestDB
//
//  Created by 戴运鹏 on 2018/10/13.
//  Copyright © 2018年 戴运鹏. All rights reserved.
//

#import "FileHelper.h"

@implementation FileHelper
+ (NSString *)dirPathInLibraryNamed:(NSString *)dirName
{
    NSString * docsdir = [NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES) lastObject];
    NSString *dataFilePath = [docsdir stringByAppendingPathComponent:@"EasySale"]; // 在Library目录下创建 "EasySale" 文件夹
    NSFileManager *fileManager = [NSFileManager defaultManager];
    
    BOOL isDir = NO;
    
    // fileExistsAtPath 判断一个文件或目录是否有效，isDirectory判断是否一个目录
    BOOL existed = [fileManager fileExistsAtPath:dataFilePath isDirectory:&isDir];
    
    if (!(isDir && existed)) {
        // 在Document目录下创建一个EasySale目录
        [fileManager createDirectoryAtPath:dataFilePath withIntermediateDirectories:YES attributes:nil error:nil];
    }
    NSString *file = [dataFilePath stringByAppendingPathComponent:dirName];
    return file;
}
@end
