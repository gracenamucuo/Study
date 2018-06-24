//
//  ETLayoutAttributeMaker.m
//  Layout_Demo
//
//  Created by 戴运鹏 on 2018/6/24.
//  Copyright © 2018年 戴运鹏. All rights reserved.
//

#import "ETLayoutAttributeMaker.h"
#import "MASViewAttribute.h"
@implementation ETLayoutAttributeMaker

+ (MASViewAttribute*)makeLayoutAttributeWithView:(UIView *)view direction:(NSLayoutAttribute)direction
{
    return [[MASViewAttribute alloc]initWithView:view layoutAttribute:direction];
}

@end
