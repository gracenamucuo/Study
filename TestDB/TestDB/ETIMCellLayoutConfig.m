//
//  ETIMCellLayoutConfig.m
//  Inventory
//
//  Created by 戴运鹏 on 2018/9/21.
//  Copyright © 2018年 Elegant Team. All rights reserved.
//

#import "ETIMCellLayoutConfig.h"
//#import "GeneralHeader.h"
@implementation ETIMCellLayoutConfig

+ (instancetype)shareLayoutConfig
{
    static ETIMCellLayoutConfig *manager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[ETIMCellLayoutConfig alloc]init];
    });
    return manager;
}

 - (UIEdgeInsets)textInsets
{
    return UIEdgeInsetsMake(10, 10, 10, 10);
}

- (CGFloat)lineSpacing
{
    return 5.f;
}

- (CGFloat)textMaxWidth
{
    return [[UIScreen mainScreen] bounds].size.width ;
}

- (NSMutableAttributedString *)attriTextCellWithMsg:(NSString *)msg textColor:(nonnull UIColor *)color
{
  NSDictionary *attributes = [self textMsgAtttiDicWithTextColor:color];
    NSMutableAttributedString *attri = [[NSMutableAttributedString alloc]initWithString:msg];
    [attri addAttributes:attributes range:NSMakeRange(0, msg.length)];
    return attri;
}
- (NSDictionary*)textMsgAtttiDicWithTextColor:(UIColor *)color
{
    NSMutableParagraphStyle *paragraphStyle = [[NSParagraphStyle defaultParagraphStyle] mutableCopy];
    paragraphStyle.lineBreakMode = NSLineBreakByWordWrapping;
    paragraphStyle.alignment = NSTextAlignmentLeft;
    paragraphStyle.lineSpacing = 5;
    NSDictionary* attributes = @{NSFontAttributeName:[UIFont fontWithName:@"HelveticaNeue-Medium" size:14],
                                 NSParagraphStyleAttributeName: paragraphStyle,
                                 NSForegroundColorAttributeName: color?:[UIColor whiteColor]};
    return attributes;
}

- (BOOL)mulitiLinesWithTextMsg:(NSString *)msg
{
    CGSize limitSize = CGSizeMake(MAXFLOAT, 20);
    NSMutableAttributedString *attri = [[NSMutableAttributedString alloc]initWithString:msg];
    [attri addAttributes:[self textMsgAtttiDicWithTextColor:nil] range:NSMakeRange(0, msg.length)];
    CGRect rect = [attri boundingRectWithSize:limitSize options:NSStringDrawingUsesFontLeading | NSStringDrawingUsesLineFragmentOrigin context:nil];
    return rect.size.width > self.textMaxWidth-20;
}




@end
