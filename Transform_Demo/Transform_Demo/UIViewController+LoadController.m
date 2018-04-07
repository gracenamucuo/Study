//
//  UIViewController+LoadController.m
//  CustomTransition_Demo
//
//  Created by 戴运鹏 on 2018/4/5.
//  Copyright © 2018年 戴运鹏. All rights reserved.
//

#import "UIViewController+LoadController.h"

@implementation UIViewController (LoadController)

+ (instancetype)loadFromMainStoryboard
{
    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    return [sb instantiateViewControllerWithIdentifier:NSStringFromClass([self class])];
}

@end
