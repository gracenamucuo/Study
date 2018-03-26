//
//  A.m
//  Runtime_Demo
//
//  Created by 戴运鹏 on 2018/3/22.
//  Copyright © 2018年 戴运鹏. All rights reserved.
//

#import "A.h"
#import "B.h"
@implementation A

- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector
{
    NSMethodSignature *signature = [super methodSignatureForSelector:aSelector];
    if (!signature) {
        B *b = [[B alloc]init];
        signature = [b methodSignatureForSelector:aSelector];
    }
    return signature;
}

- (void)forwardInvocation:(NSInvocation *)anInvocation
{
    B *b = [[B alloc]init];
    [anInvocation invokeWithTarget:b];
}

- (void)doesNotRecognizeSelector:(SEL)aSelector
{
    [super doesNotRecognizeSelector:aSelector];
}

@end
