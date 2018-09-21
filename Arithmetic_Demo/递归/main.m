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

//尾递归

int facttail(int n,int a)
{
    if (n < 0) {
        return 0;
    }else if (n == 0 || n == 1){
        return a;
    }else{
        return facttail(n - 1, n * a);//函数返回时，调用自己，并且不含表达式
    }
}



int main(int argc, const char * argv[]) {
    @autoreleasepool {
//        printf("%d\n",fact(15));
        printf("%d\n",facttail(12, 1));
    }
    return 0;
}
