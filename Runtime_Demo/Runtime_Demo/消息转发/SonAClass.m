//
//  SonAClass.m
//  Runtime_Demo
//
//  Created by 戴运鹏 on 2018/3/26.
//  Copyright © 2018年 戴运鹏. All rights reserved.
//

#import "SonAClass.h"
#import <objc/runtime.h>
#import "SonBClass.h"
#import "SonBClass.h"
@implementation SonAClass

void dynamicBindMethod(id self,SEL _cmd)
{
    NSLog(@"C函数动态添加方法实现");
}

void dynamicBindClassMethod(id self,SEL _cmd)
{
    NSLog(@"动态添加类方法的实现");
}

//+ (BOOL)resolveInstanceMethod:(SEL)sel
//{
//    //这里就是给该类一个动态添加方法的机会。可以添加别的类的方法的实现，也可以直接在这里添加C函数的实现
//    if ([NSStringFromSelector(sel) isEqualToString:@"dynamicBindMethod"]) {
////          class_addMethod([self class], @selector(dynamicBindMethod), method_getImplementation(class_getInstanceMethod([SonBClass class], @selector(dynamicBindMethod))), "@:");
//        //因为该方法是类方法，所以self 和[self class]一样，都是返回类对象
//        class_addMethod(self, @selector(dynamicBindMethod), (IMP)dynamicBindMethod, "@:");
//    }
//    return [super resolveInstanceMethod:sel];
//}

//+ (BOOL)resolveClassMethod:(SEL)sel
//{
//    if ([NSStringFromSelector(sel) isEqualToString:@"dynamicBindClassMethod"]) {
//        //给类方法动态添加方法，因为类方法是存在元类中的，所以第一个参数应该用元类对象objc_getClass(self)
//
//        class_addMethod(object_getClass(self), @selector(dynamicBindClassMethod), (IMP)dynamicBindClassMethod, "@:");
//    }
//    return [super resolveClassMethod:sel];
//}

+ (void)getAllMethods
{
    unsigned int count = 0;
    Method *methods = class_copyMethodList([SonAClass class], &count);
    NSMutableArray *arr = [NSMutableArray array];
    for (int i = 0; i < count; i++) {
        Method m = methods[i];
        IMP imp = method_getImplementation(m);
        SEL sel = method_getName(m);
        NSLog(@"子类------%s",sel_getName(sel));
        [arr addObject:[NSString stringWithUTF8String:sel_getName(sel)]];
    }
    free(methods);
    NSLog(@"%@",arr);
}

//- (id)forwardingTargetForSelector:(SEL)aSelector
//{
//    if ([NSStringFromSelector(aSelector) isEqualToString:@"dynamicBindMethod"]) {
//    return [[SonBClass alloc]init];
//    }
//    return [super forwardingTargetForSelector:aSelector];
//}


- (NSMethodSignature*)methodSignatureForSelector:(SEL)aSelector
{
    NSMethodSignature *signature = [super methodSignatureForSelector:aSelector];
    if (!signature) {
        if ([SonBClass instancesRespondToSelector:aSelector]) {
            signature = [SonBClass instanceMethodSignatureForSelector:aSelector];
        }
    }
    return signature;
}

- (void)forwardInvocation:(NSInvocation *)anInvocation
{
    if ([SonBClass instancesRespondToSelector:anInvocation.selector]) {
        [anInvocation invokeWithTarget:[[SonBClass alloc]init]];
    }
}
@end














