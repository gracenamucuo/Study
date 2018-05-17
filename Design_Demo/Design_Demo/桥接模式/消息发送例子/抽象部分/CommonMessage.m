//
//  CommonMessage.m
//  Design_Demo
//
//  Created by 戴运鹏 on 2018/5/17.
//  Copyright © 2018年 戴运鹏. All rights reserved.
//

#import "CommonMessage.h"

@implementation CommonMessage

- (void)send:(NSMutableString *)message
{
    [message insertString:@"【普通消息:" atIndex:0];
    [message appendString:@"】"];
    [self.messageSendIm sendMessage:message];
}

@end
