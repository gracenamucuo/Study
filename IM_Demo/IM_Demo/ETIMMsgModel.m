//
//  ETIMMsgModel.m
//  IM_Demo
//
//  Created by 戴运鹏 on 2018/9/13.
//  Copyright © 2018年 戴运鹏. All rights reserved.
//

#import "ETIMMsgModel.h"

@implementation ETIMMsgModel
- (instancetype)initWithType:(NSString *)type message:(NSString *)msg
{
    if (self = [super init]) {
        _type = type;
        _msg = msg;
    }
    return self;
}
@end
