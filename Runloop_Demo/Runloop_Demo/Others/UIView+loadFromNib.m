//
//  UIView+loadFromNib.m
//  Design_Demo
//
//  Created by 戴运鹏 on 2018/5/18.
//  Copyright © 2018年 戴运鹏. All rights reserved.
//

#import "UIView+loadFromNib.h"

@implementation UIView (loadFromNib)

+ (instancetype)loadFromNib
{
    NSArray *array = [[NSBundle mainBundle]loadNibNamed:NSStringFromClass(self) owner:nil options:nil];
    return array[0];
}

@end
