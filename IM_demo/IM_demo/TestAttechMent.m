//
//  TestAttechMent.m
//  IM_demo
//
//  Created by 戴运鹏 on 2018/9/7.
//  Copyright © 2018年 戴运鹏. All rights reserved.
//

#import "TestAttechMent.h"

@implementation TestAttechMent


- (NSString *)encodeAttachment{
    NSDictionary *dict = @{@"title":self.title,@"subTitle":self.subTitle};
    NSData *data = [NSJSONSerialization dataWithJSONObject:dict options:0 error:nil];
    NSString *encodeString = @"";
    if (data) {
        encodeString = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    }
    return encodeString;
}

//其他协议如上传下载托管可根据自己的业务需求选择实现


#pragma mark - Getter
- (NSString *)title{
    if (!_title) {
        _title = @"";
    }
    return _title;
}

- (NSString *)subTitle{
    if (!_subTitle) {
        _subTitle = @"";
    }
    return _subTitle;
}

@end
