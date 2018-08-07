//
//  main.m
//  栈
//
//  Created by 戴运鹏 on 2018/8/7.
//  Copyright © 2018年 戴运鹏. All rights reserved.
//

#import <Foundation/Foundation.h>
#include <string.h>
#include <stdio.h>
    //回文判断  用栈的思想、

int main(int argc, const char * argv[]) {
    @autoreleasepool {

    }
    return 0;
}
//回文
void plalindromeTest()
{
    char a[101],s[101];
    int i,len,mid,next,top;
    gets(a);
    len = strlen(a);
    mid = len / 2 -1;
    top = 0;
    for (i = 0; i <= mid; i++) {
        s[++top] = a[i];
    }
    if (len % 2 == 0) {
        next = mid + 1;
    }else{
        next = mid + 2;
    }
    for (i = next; i <= len - 1; i++) {
        if (a[i] != s[top]) {
            break;
        }
        top--;
    }
    if (top == 0) {
        printf("YES");
    }else{
        printf("NO");
    }
    
    getchar();getchar();
}
