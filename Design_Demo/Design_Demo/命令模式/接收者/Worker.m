//
//  Worker.m
//  Design_Demo
//
//  Created by 戴运鹏 on 2018/5/23.
//  Copyright © 2018年 戴运鹏. All rights reserved.
//

#import "Worker.h"

@implementation Worker

+ (instancetype)sharedWorker
{
    static Worker *sharedWorker = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedWorker = [[Worker alloc]init];
    });
    return sharedWorker;
}

@end
