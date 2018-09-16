//
//  SqliteTool.h
//  Sqlite_Demo
//
//  Created by 戴运鹏 on 2018/9/15.
//  Copyright © 2018年 戴运鹏. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SqliteTool : NSObject
+ (BOOL)deal:(NSString *)sql user_id:(NSString *)user_id;

+ (NSMutableArray<NSMutableDictionary*>*)querySql:(NSString *)sql user_id:(NSString *)user_id;

@end
