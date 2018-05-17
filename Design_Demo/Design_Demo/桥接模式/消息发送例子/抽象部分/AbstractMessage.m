//
//  AbstractMessage.m
//  Design_Demo
//
//  Created by 戴运鹏 on 2018/5/17.
//  Copyright © 2018年 戴运鹏. All rights reserved.
//

#import "AbstractMessage.h"

@implementation AbstractMessage

- (instancetype)initWithImplement:(id<MessageImplementProtocol>)implement
{
    if (self = [super init]) {
        self.messageSendIm = implement;
    }
    return self;
}

- (void)send:(NSMutableString *)message
{
    
}

@end
