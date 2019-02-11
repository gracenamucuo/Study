//
//  KVCClass.m
//  类别与扩展
//
//  Created by 戴运鹏 on 2019/2/11.
//  Copyright © 2019 戴运鹏. All rights reserved.
//

#import "KVCClass.h"

@implementation KVCClass

- (void)setStringA:(NSString *)stringA
{
    NSLog(@"执行 setter stringA");
    _stringA = stringA;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        _modelA = [[KVCModel alloc]init];
    }
    return self;
}

@end
