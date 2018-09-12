//
//  ETIMInputView.m
//  IM_Demo
//
//  Created by 戴运鹏 on 2018/9/12.
//  Copyright © 2018年 戴运鹏. All rights reserved.
//

#import "ETIMInputView.h"
#import "ETInputView.h"
#import "YZInputView.h"
@interface ETIMInputView()
@property (nonatomic,assign)ETIMInputViewType inputType;
@end

@implementation ETIMInputView

- (instancetype)initWithInputType:(ETIMInputViewType)inputType
{
    if (self = [super init]) {
        _inputType = inputType;
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    switch (self.inputType) {
        case ETIMInputViewType_text:
        {
            [self buileTextTypeUI];
        }
            break;
        default:
            break;
    }
}

///文本输入UI
- (void)buileTextTypeUI
{
    self.backgroundColor = [UIColor greenColor];
//    ETInputView *input = [[ETInputView alloc]initWithFrame:CGRectMake(5, 5, [UIScreen mainScreen].bounds.size.width - 10, 40)];
    YZInputView *input = [[YZInputView alloc]initWithFrame:CGRectMake(5, 5, [UIScreen mainScreen].bounds.size.width - 10, 40)];
    input.font =[UIFont systemFontOfSize:14];
    input.maxNumberOfLines = 4;
    __weak typeof(self) weakSelf = self;
    input.yz_textHeightChangeBlock = ^(NSString *text, CGFloat textHeight) {
        if (weakSelf.hBlock) {
            weakSelf.hBlock(textHeight + 10);
        }
    };
    [self addSubview:input];
}

@end
