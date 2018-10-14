//
//  TestModel.h
//  TestDB
//
//  Created by 戴运鹏 on 2018/10/8.
//  Copyright © 2018年 戴运鹏. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN

@interface TestModel : NSObject
@property (nonatomic,copy)NSString *from_type;
@property (nonatomic,copy)NSString *message_id;
@property (nonatomic,copy)NSString *type;//type 为1是文本消息
@property (nonatomic,copy)NSString *date;//时间
@property (nonatomic,copy)NSString *content;//内容
@property (nonatomic,copy)NSString *customer_mobile;
@property (nonatomic,copy)NSString *customer_id;
@property (nonatomic,copy)NSString *customer_name;
@property (nonatomic,copy)NSString *status;
@property (nonatomic,assign)BOOL sendSuccess;//发送成功
@property (nonatomic,assign)double height;//cell的高度

@property (nonatomic,assign)NSInteger pkid;//主键
@property (nonatomic,assign)BOOL  isclient;
+ (instancetype)initWithStr:(NSString *)str;
- (CGFloat)textHeight;
@end

NS_ASSUME_NONNULL_END
