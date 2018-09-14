
//
//  ETInputView.m
//  IM_Demo
//
//  Created by 戴运鹏 on 2018/9/12.
//  Copyright © 2018年 戴运鹏. All rights reserved.
//

#import "ETInputView.h"

@interface ETInputView()

@property (nonatomic,assign)CGFloat textHeight;
@property (nonatomic,assign)CGFloat maxTextHeight;

@end

@implementation ETInputView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self setup];
    }
    return self;
}

- (void)setup
{
    self.scrollEnabled = NO;
    self.scrollsToTop = NO;
    self.showsHorizontalScrollIndicator = NO;
    self.enablesReturnKeyAutomatically = YES;
    self.layer.borderWidth = 1;
    self.layer.cornerRadius = 5;
    self.returnKeyType = UIReturnKeySend;
    self.layer.borderColor = [UIColor lightGrayColor].CGColor;
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textDidChange) name:UITextViewTextDidChangeNotification object:self];
}

- (void)setMaxNumberOfLines:(NSUInteger)maxNumberOfLines
{
    _maxNumberOfLines = maxNumberOfLines;
    _maxTextHeight = ceil(self.font.lineHeight * (maxNumberOfLines)+self.textContainerInset.top + self.textContainerInset.bottom);
}
//
- (void)textDidChange
{
    NSInteger height = ceilf([self sizeThatFits:CGSizeMake(self.bounds.size.width, MAXFLOAT)].height);
        height = height>40?height:40;
    if (self.textHeight != height) {
    
        self.scrollEnabled = height > self.maxTextHeight &&self.maxTextHeight >0;
        self.textHeight = height;
        if (self.textHeightChangeBlock&&!self.scrollEnabled) {
            self.textHeightChangeBlock(self.text, height);
            [self.superview layoutIfNeeded];
        }
    }
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter]removeObserver:self];
}

@end









































































































































