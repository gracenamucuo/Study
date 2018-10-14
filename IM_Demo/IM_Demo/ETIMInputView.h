//
//  ETIMInputView.h
//  IM_Demo
//
//  Created by 戴运鹏 on 2018/9/12.
//  Copyright © 2018年 戴运鹏. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef NS_ENUM(NSUInteger, ETIMInputViewType) {
    ETIMInputViewType_text = 1,
};

@protocol ETIMInputViewDelegate <NSObject>

- (void)didSendMessage:(NSString *)msg;


@end

@interface ETIMInputView : UIView
@property (nonatomic,copy)void(^hBlock)(CGFloat height);
@property (nonatomic,weak)id<ETIMInputViewDelegate> delegate;

- (instancetype)initWithInputType:(ETIMInputViewType)inputType;
- (void)setText:(NSString *)text;
@end
