//
//  MsgModel.h
//  TestDB
//
//  Created by 戴运鹏 on 2018/10/13.
//  Copyright © 2018年 戴运鹏. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface MsgModel : NSObject
@property (nonatomic,copy)NSString *content;
@property (nonatomic,assign)NSInteger height;
@property (nonatomic,assign)BOOL success;
@property (nonatomic,assign)double length;
@property (nonatomic,copy)NSString *date;
@property (nonatomic,assign)NSInteger pkid;
- (instancetype)initWithContent:(NSString *)content height:(NSInteger)height;
@end

NS_ASSUME_NONNULL_END
