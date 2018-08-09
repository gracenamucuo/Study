//
//  main.m
//  枚举_炸弹游戏
//
//  Created by 戴运鹏 on 2018/8/8.
//  Copyright © 2018年 戴运鹏. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {//二维数组，行是x。 列是y
    @autoreleasepool {
        char a[20][21];
        int n,i;
        printf("输入n");
        scanf("%d",&n);
        printf("输入:");
        for (i = 0; i <= n - 1; i++) {
            scanf("%s",a[i]);
        }
        printf("%s",a[0]);
    }
    return 0;
}
