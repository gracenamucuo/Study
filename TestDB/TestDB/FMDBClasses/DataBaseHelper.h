//
//  DataBaseHelper.h
//  TestDB
//
//  Created by 戴运鹏 on 2018/10/14.
//  Copyright © 2018年 戴运鹏. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MsgModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface DataBaseHelper : NSObject
- (void)createTableWithName:(NSString *)name;
- (BOOL)insertMessage:(MsgModel *)msg inTableName:(NSString *)name;
- (NSArray *)insertMessages:(NSArray *)msgs inTableName:(NSString*)name;
- (NSArray*)lookUpAllDataWithTable:(NSString *)tableName completion:(void(^)(NSArray *arr))completion;
- (NSInteger)maxPrimaryWithTable:(NSString *)tableName;
- (NSArray *)lookUpWithSql:(NSString *)sql;
@end


NS_ASSUME_NONNULL_END
