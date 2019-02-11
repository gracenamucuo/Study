//
//  KVCModel.m
//  类别与扩展
//
//  Created by 戴运鹏 on 2019/2/11.
//  Copyright © 2019 戴运鹏. All rights reserved.
//

#import "KVCModel.h"

@implementation KVCModel

- (void)set_modelString:(NSString *)_modelString
{
    __modelString = _modelString;
    NSLog(@"执行setter _modelString");
}

- (void)setModelString:(NSString *)modelString
{
    NSLog(@"执行 setter modelString");
}

- (void)setNoExist1:(NSString *)noExist{
    NSLog(@"执行 setter noExist1");
}

@end
