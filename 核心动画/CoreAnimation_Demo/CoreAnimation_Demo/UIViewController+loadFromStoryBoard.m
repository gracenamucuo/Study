//
//  UIViewController+loadFromStoryBoard.m
//  CoreAnimation_Demo
//
//  Created by 戴运鹏 on 2018/4/29.
//  Copyright © 2018年 戴运鹏. All rights reserved.
//

#import "UIViewController+loadFromStoryBoard.h"

@implementation UIViewController (loadFromStoryBoard)

+ (instancetype)loadFromStoryBoard
{
    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
    UIViewController *vc = [sb instantiateViewControllerWithIdentifier:NSStringFromClass([self class])];
    return vc;
}

@end
