//
//  BackDestoryModel.m
//  Performance_Demo
//
//  Created by 戴运鹏 on 2018/6/12.
//  Copyright © 2018年 戴运鹏. All rights reserved.
//

#import "BackDestoryModel.h"

@implementation BackDestoryModel

- (void)dealloc
{
    NSLog(@"%@",[NSThread currentThread]);
}

@end
