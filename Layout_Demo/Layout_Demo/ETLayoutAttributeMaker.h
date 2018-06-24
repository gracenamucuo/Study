//
//  ETLayoutAttributeMaker.h
//  Layout_Demo
//
//  Created by 戴运鹏 on 2018/6/24.
//  Copyright © 2018年 戴运鹏. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@class MASViewAttribute;
@interface ETLayoutAttributeMaker : NSObject

+ (MASViewAttribute*)makeLayoutAttributeWithView:(UIView*)view direction:(NSLayoutAttribute)direction;

@end
