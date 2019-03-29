//
//  UILabel+Font.m
//  埋点
//
//  Created by 戴运鹏 on 2019/3/11.
//  Copyright © 2019 戴运鹏. All rights reserved.
//

#import "UILabel+Font.h"

#import "HookUtility.h"

@implementation UILabel (Font)

//+ (void)load
//{
////    NSLog(@"控制器的load方法");
//    static dispatch_once_t onceToken;
//    dispatch_once(&onceToken, ^{
//        SEL originalSelector = @selector(setFont:);
//        SEL swizzledSelector = @selector(sw_setFont:);
////
//        
//        [HookUtility swizzlingInClass:self originalSelector:originalSelector swizzledSelector:swizzledSelector];
//    });
//}
//- (void)setFont:(UIFont *)font
//{
//
//}

- (void)sw_setFont:(UIFont *)font
{
    NSLog(@"交换了label的方法");
    [self sw_setFont:[UIFont fontWithName:font.familyName size:font.pointSize * 2]];
}

@end
