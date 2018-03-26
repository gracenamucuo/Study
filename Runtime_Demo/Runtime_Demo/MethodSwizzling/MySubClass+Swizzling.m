//
//  MySubClass+Swizzling.m
//  Runtime_Demo
//
//  Created by 戴运鹏 on 2018/3/26.
//  Copyright © 2018年 戴运鹏. All rights reserved.
//

#import "MySubClass+Swizzling.h"
#import <objc/runtime.h>
#import "MyClass.h"
@implementation MySubClass (Swizzling)

+ (void)load
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Class class = [self class];
        SEL originalSlector = @selector(superMethod);
        SEL swizzledSelector = @selector(swizzlingMethod);
        Method originalMethod = class_getInstanceMethod(class, originalSlector);
        Method swizzledMethod = class_getInstanceMethod(class, swizzledSelector);


        BOOL didAddMethod = class_addMethod(class, originalSlector, method_getImplementation(swizzledMethod), method_getTypeEncoding(swizzledMethod));

        if (didAddMethod) {
            class_replaceMethod(class, swizzledSelector, method_getImplementation(originalMethod), method_getTypeEncoding(originalMethod));

            NSLog(@"");
            [self getSuperAllMethods];
            [self getAllMethods];
            
        }else{
            
            method_exchangeImplementations(originalMethod, swizzledMethod);
            NSLog(@"");
            
        }

    });
}

+ (void)getSuperAllMethods
{
    unsigned int count = 0;
    Method *methods = class_copyMethodList([MyClass class], &count);
    NSMutableArray *arr = [NSMutableArray array];
    for (int i = 0; i < count; i++) {
        Method m = methods[i];
        IMP imp = method_getImplementation(m);
        SEL sel = method_getName(m);
//        NSLog(@"super-----%s",sel_getName(sel));
        [arr addObject:[NSString stringWithUTF8String:sel_getName(sel)]];
    }
    free(methods);
//    NSLog(@"%@",arr);
}

+ (void)getAllMethods
{
    unsigned int count = 0;
    Method *methods = class_copyMethodList([MySubClass class], &count);
    NSMutableArray *arr = [NSMutableArray array];
    for (int i = 0; i < count; i++) {
        Method m = methods[i];
        IMP imp = method_getImplementation(m);
        SEL sel = method_getName(m);
//        NSLog(@"子类------%s",sel_getName(sel));
        [arr addObject:[NSString stringWithUTF8String:sel_getName(sel)]];
    }
    free(methods);
//    NSLog(@"%@",arr);
}

- (void)swizzlingMethod
{
//    NSLog(@"swizzling 交换的方法");
}


@end
