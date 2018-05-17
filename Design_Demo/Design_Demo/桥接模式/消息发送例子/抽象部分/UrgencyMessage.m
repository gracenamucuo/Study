//
//  UrgencyMessage.m
//  Design_Demo
//
//  Created by 戴运鹏 on 2018/5/17.
//  Copyright © 2018年 戴运鹏. All rights reserved.
//

#import "UrgencyMessage.h"

@implementation UrgencyMessage

- (void)send:(NSMutableString *)message
{
    [message insertString:@"【加急消息:" atIndex:0];
    [message appendString:@"】"];
    [self.messageSendIm sendMessage:message];
}

@end
