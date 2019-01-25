//
//  main.m
//  C语言
//
//  Created by 戴运鹏 on 2019/1/24.
//  Copyright © 2019 戴运鹏. All rights reserved.
//

#import <Foundation/Foundation.h>

struct Person{
    char name[3];
    int age;
};

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        struct Person p = {"124",10};
        struct Person *p1 =&p;
        
        
        
    }
    return 0;
}
