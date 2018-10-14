//
//  ETIMCellLayoutConfig.h
//  Inventory
//
//  Created by 戴运鹏 on 2018/9/21.
//  Copyright © 2018年 Elegant Team. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN

@interface ETIMCellLayoutConfig : NSObject

+ (instancetype)shareLayoutConfig;

@property (nonatomic,assign,readonly)UIEdgeInsets textInsets;
@property (nonatomic,assign,readonly)CGFloat lineSpacing;
@property (nonatomic,assign,readonly)CGFloat textMaxWidth;

/**
 文本信息富文本

 @param msg x文本
 @return 富文本
 */
- (NSMutableAttributedString *)attriTextCellWithMsg:(NSString *)msg textColor:(UIColor *)color;
- (NSDictionary *)textMsgAtttiDicWithTextColor:(UIColor *)color;

/**
 是否多行

 @return 是否
 */
- (BOOL)mulitiLinesWithTextMsg:(NSString *)msg;

@end

NS_ASSUME_NONNULL_END
