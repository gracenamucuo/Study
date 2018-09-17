//
//  TableTool.h
//  Sqlite_Demo
//
//  Created by 戴运鹏 on 2018/9/16.
//  Copyright © 2018年 戴运鹏. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TableTool : NSObject
+ (NSArray *)tableSortedColumnNamesCls:(Class)cls uid:(NSString *)uid;
@end
