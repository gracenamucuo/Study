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
#import "Masonry.h"

#define S_WIDTH [[UIScreen mainScreen] bounds].size.width
#define S_HEIGHT [[UIScreen mainScreen] bounds].size.height

@interface ETIMInputView()<UITextViewDelegate>
@property (nonatomic,assign)ETIMInputViewType inputType;
@property (nonatomic,strong)ETInputView *inputView;
@end

@implementation ETIMInputView

- (void)awakeFromNib
{
    [super awakeFromNib];
           [self buileTextTypeUI];
}

- (instancetype)initWithInputType:(ETIMInputViewType)inputType
{
    if (self = [super init]) {
        _inputType = inputType;
        [self buileTextTypeUI];
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
//    switch (self.inputType) {
//        case ETIMInputViewType_text:
//        {
//            
//        }
//            break;
//        default:
//            break;
//    }
}

///文本输入UI
- (void)buileTextTypeUI
{
    self.backgroundColor = [UIColor greenColor];

    ETInputView *input = [[ETInputView alloc]initWithFrame:CGRectZero];
    input.font =[UIFont systemFontOfSize:16];
    input.maxNumberOfLines = 4;
    self.inputView = input;
    self.inputView.delegate = self;
    self.inputView.frame = CGRectMake(5, 5, S_WIDTH - 10, 40);
    [self addSubview:input];
    
    
    
//    [input mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.left.equalTo(self).offset(5);
//        make.right.equalTo(self.mas_right).offset(-5);
//        make.bottom.equalTo(self.mas_bottom).offset(-5);
//    }];
    __weak typeof(self) weakSelf = self;
    input.textHeightChangeBlock = ^(NSString *text, CGFloat textHeight) {
        CGRect inputFrame = weakSelf.inputView.frame;
        inputFrame.size.height = textHeight;
        weakSelf.inputView.frame = inputFrame;
        if (weakSelf.hBlock) {
            weakSelf.hBlock(textHeight + 10);
        }
    };
    
}
#pragma mark -- UITextViewDelegate
- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text
{
    if ([text isEqualToString:@"\n"]) {
        
        if ([self.delegate respondsToSelector:@selector(didSendMessage:)]) {
            [self.delegate didSendMessage:textView.text];
        }
        textView.text = @"";
//        [textView resignFirstResponder];
        if (self.inputView.textHeightChangeBlock) {
            self.inputView.textHeightChangeBlock(@"", 40);
        }
      
        return NO;
    }
    return YES;
}

- (void)setText:(NSString *)text
{
    self.inputView.text = text;
}
@end
