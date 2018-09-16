//
//  SqliteModelTool.h
//  Sqlite_Demo
//
//  Created by 戴运鹏 on 2018/9/16.
//  Copyright © 2018年 戴运鹏. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ModelProtocol.h"
@interface SqliteModelTool : NSObject
+ (BOOL)createTable:(Class)cls uid:(NSString *)uid;

+ (BOOL)isTableRequiredUpdate:(Class)cls uid:(NSString *)uid;

+ (BOOL)updateTable:(Class)cls uid:(NSString *)uid;
@end
