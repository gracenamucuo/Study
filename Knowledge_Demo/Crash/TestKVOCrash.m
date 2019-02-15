//
//  TestKVOCrash.m
//  Crash
//
//  Created by 戴运鹏 on 2019/2/15.
//  Copyright © 2019 戴运鹏. All rights reserved.
//

#import "TestKVOCrash.h"

@implementation TestKVOCrash

- (void)dealloc
{
    NSLog(@"%@ 销毁",[self class]);
}


@end
