//
//  main.m
//  C语言
//
//  Created by 戴运鹏 on 2019/1/24.
//  Copyright © 2019 戴运鹏. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSString *str = @"123";
        char *c = [str cStringUsingEncoding:NSUTF8StringEncoding];
        puts(c);
        
    }
    return 0;
}
