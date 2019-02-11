//
//  WeakInstance.m
//  Knowledge_Demo
//
//  Created by 戴运鹏 on 2019/1/25.
//  Copyright © 2019 戴运鹏. All rights reserved.
//

#import "WeakInstance.h"

@implementation WeakInstance
+ (id)sharedInstance
{
    static __weak WeakInstance *instance;
    WeakInstance *strongInstance = instance;
    @synchronized(self) {
        if (strongInstance == nil) {
            strongInstance = [[[self class] alloc] init];
            instance = strongInstance;
        }
    }
    return strongInstance;
}

- (void)dealloc
{
    NSLog(@"%@ 销毁",[self class]);
}

@end
