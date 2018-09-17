//
//  ModelProtocol.h
//  Sqlite_Demo
//
//  Created by 戴运鹏 on 2018/9/16.
//  Copyright © 2018年 戴运鹏. All rights reserved.
//

#import <Foundation/Foundation.h>
@protocol ModelProtocol <NSObject>
@required;

/**
 主键

 @return
 */
+ (NSString*)primaryKey;
@optional;

/**
 忽略字段

 @return
 */
+ (NSArray *)ignoreColumnNames;

/**
 新字段名称->旧字段名称的映射表格

 @return 映射表格
 */
+ (NSDictionary *)newNameToOldNameDic;

@end
