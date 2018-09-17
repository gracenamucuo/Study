//
//  main.m
//  Test
//
//  Created by 戴运鹏 on 2018/9/14.
//  Copyright © 2018年 戴运鹏. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        int b = 10;
        int *a =&b;
        printf("%d---%d",a,*a);
        *a = 11;
        //取值 *
        //取址 &
    }
    return 0;
}


































