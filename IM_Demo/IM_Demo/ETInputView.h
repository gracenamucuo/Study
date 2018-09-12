//
//  ETInputView.h
//  IM_Demo
//
//  Created by 戴运鹏 on 2018/9/12.
//  Copyright © 2018年 戴运鹏. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ETInputView : UITextView

@property (nonatomic,assign)NSUInteger maxNumberOfLines;

@property (nonatomic,copy)void (^textHeightChangeBlock)(NSString *text,CGFloat textHeight);

@end
