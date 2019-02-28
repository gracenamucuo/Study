//
//  SetHook.m
//  Eqaul_Demo
//
//  Created by 戴运鹏 on 2019/2/28.
//  Copyright © 2019 戴运鹏. All rights reserved.
//

#import "SetHook.h"
#import <objc/runtime.h>
@implementation SetHook
//+ (void)load{
//    Class aClass = objc_getClass("__NSSetM");
//    SEL sel = @selector(hook_member:);
//    Method method = class_getClassMethod([self class], sel);
//    class_addMethod(aClass, sel, class_getMethodImplementation([self class], sel), method_getTypeEncoding(method));
//    exchangeMethod(aClass, @selector(member:), sel);
//}
//
//- (void)hook_member:(id)arg1{
//    [self hook_member:arg1];
//}
//
//void exchangeMethod(Class aClass, SEL oldSEL, SEL newSEL) {
//    Method oldMethod = class_getInstanceMethod(aClass, oldSEL);
//    Method newMethod = class_getInstanceMethod(aClass, newSEL);
//    method_exchangeImplementations(oldMethod, newMethod);
//}
@end
