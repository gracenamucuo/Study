//
//  ClassAdapter.m
//  Design_Demo
//
//  Created by 戴运鹏 on 2018/5/18.
//  Copyright © 2018年 戴运鹏. All rights reserved.
//

#import "ClassAdapter.h"

@implementation ClassAdapter



- (UIImage *)getRenderImage {
    return [self getDoorImage];
}

- (NSString *)getRenderInfo {
    return [self getDoorInfo];
}

- (UIImage *)getDoorImage
{
    UIImage *image = [UIImage imageNamed:@"door.png"];
    return image;
}

- (NSString *)getDoorInfo
{
    return @"这是door的信息说明";
}

@end
