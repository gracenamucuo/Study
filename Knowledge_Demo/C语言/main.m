//
//  main.m
//  C语言
//
//  Created by 戴运鹏 on 2019/1/24.
//  Copyright © 2019 戴运鹏. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"
#import "Son.h"
#import <objc/runtime.h>
//struct Person{
//    char name[3];
//    int age;
//};

void multiThread();
int main(int argc, const char * argv[]) {
    @autoreleasepool {
//        struct Person p = {"124",10};
//        struct Person *p1 =&p;
        
//        NSString *str = @"123";
//        NSLog(@"%p",str);
//        [Son staticMethod];
        
//        NSObject *obj = [NSObject new];
//        obj = nil;
//        Class cls = [Person class];
//        cls = Nil;
        Person *p = [[Person alloc]init];
        NSLog(@"%d",class_getInstanceSize([p class]));
    }
    return 0;
}


