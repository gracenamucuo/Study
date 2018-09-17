//
//  main.m
//  递归
//
//  Created by 戴运鹏 on 2018/9/14.
//  Copyright © 2018年 戴运鹏. All rights reserved.
//

#import <Foundation/Foundation.h>
//递归:递推 + 回归
int fact(int n)
{
    if (n < 0) {
        return 0;
    }else if (n == 0 || n == 1){
        return 1;
    }else{
        return n * fact(n-1);
    }
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        printf("%d",fact(5));
    }
    return 0;
}
