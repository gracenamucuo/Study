//
//  B.m
//  Runtime_Demo
//
//  Created by 戴运鹏 on 2018/3/22.
//  Copyright © 2018年 戴运鹏. All rights reserved.
//

#import "B.h"

@implementation B

- (void)b
{
    NSLog(@"------b");
}

- (void)doesNotRecognizeSelector:(SEL)aSelector
{
    [super doesNotRecognizeSelector:aSelector];
    
}

@end
