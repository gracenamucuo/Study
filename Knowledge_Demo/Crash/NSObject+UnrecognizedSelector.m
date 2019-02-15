//
//  NSObject+UnrecognizedSelector.m
//  Crash
//
//  Created by 戴运鹏 on 2019/2/15.
//  Copyright © 2019 戴运鹏. All rights reserved.
//

#import "NSObject+UnrecognizedSelector.h"
#import <objc/runtime.h>
@interface StubProxy : NSObject

@end


@implementation StubProxy



@end

void dynamicEmptyMethod(StubProxy *proxy,SEL _cmd){
    NSLog(@"将未实现的方法转发给后备接受者");
}

@implementation NSObject (UnrecognizedSelector)

- (id)forwardingTargetForSelector:(SEL)aSelector
{
    if ([NSStringFromClass([self class]) hasPrefix:@"_"]) {//需要加更多容错判断 好多系统的私有类
        return self;
    }
    class_addMethod([StubProxy class], aSelector, (IMP)dynamicEmptyMethod, "@:");
    return [[StubProxy alloc] init];
}

@end




