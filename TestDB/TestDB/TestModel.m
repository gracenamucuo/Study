//
//  TestModel.m
//  TestDB
//
//  Created by 戴运鹏 on 2018/10/8.
//  Copyright © 2018年 戴运鹏. All rights reserved.
//

#import "TestModel.h"
#import "ETIMCellLayoutConfig.h"

@implementation TestModel
+ (instancetype)initWithStr:(NSString *)str
{
   
    TestModel *t = [[self alloc] init];
    t.content = str;
    return t;
}

- (CGFloat)textHeight
{
    
    ETIMCellLayoutConfig *config = [ETIMCellLayoutConfig shareLayoutConfig];
    
    if ([config mulitiLinesWithTextMsg:self.content]) {
        NSDictionary* attributes = [config textMsgAtttiDicWithTextColor:[UIColor whiteColor]];
        CGFloat width = config.textMaxWidth;
        
        NSMutableAttributedString *attri = [[NSMutableAttributedString alloc]initWithString:self.content];
        [attri addAttributes:[config textMsgAtttiDicWithTextColor:nil] range:NSMakeRange(0, self.content.length)];
        
        CGSize limitSize = CGSizeMake(width - 60, MAXFLOAT);
        CGRect rect = [attri boundingRectWithSize:limitSize options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading context:nil];
        return ceil(rect.size.height);
//        return ceilf(rect.size.height + config.textInsets.top + config.textInsets.bottom);
    }else{
        //19是字体为14 ，行距为5时的单行的高度
        return ceil(19 + config.textInsets.top + config.textInsets.bottom);
    }
    
    
}
@end
