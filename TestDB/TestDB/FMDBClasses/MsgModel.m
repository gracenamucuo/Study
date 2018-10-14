//
//  MsgModel.m
//  TestDB
//
//  Created by 戴运鹏 on 2018/10/13.
//  Copyright © 2018年 戴运鹏. All rights reserved.
//

#import "MsgModel.h"

@implementation MsgModel

- (instancetype)initWithContent:(NSString *)content height:(NSInteger)height
{
    if (self = [super init]) {
        _content = content;
        _height = height;
        _length = 10.0;
        _date = [NSString stringWithFormat:@"%f",[[NSDate date]timeIntervalSince1970]];
    }
    return self;
}

@end
