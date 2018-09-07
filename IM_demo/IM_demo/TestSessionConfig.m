//
//  TestSessionConfig.m
//  IM_demo
//
//  Created by 戴运鹏 on 2018/9/7.
//  Copyright © 2018年 戴运鹏. All rights reserved.
//

#import "TestSessionConfig.h"

@implementation TestSessionConfig
- (NSArray *)mediaItems{
    NSArray *defaultMediaItems = [NIMKit sharedKit].config.defaultMediaItems;
    NIMMediaItem* custom =
    [NIMMediaItem item:@"sendCustomMessage"
           normalImage:[UIImage imageNamed:@"icon_custom_normal"]
         selectedImage:[UIImage imageNamed:@"icon_custom_pressed"]
                 title:@"自定义消息"];
    return [defaultMediaItems arrayByAddingObject:custom];
}

- (BOOL)disableCharlet
{
    return YES;
}

@end
