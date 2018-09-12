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

@interface ETIMInputView : UIView
@property (nonatomic,copy)void(^hBlock)(CGFloat height);
- (instancetype)initWithInputType:(ETIMInputViewType)inputType;

@end
