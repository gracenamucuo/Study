//
//  main.m
//  冒泡排序
//
//  Created by 戴运鹏 on 2018/8/6.
//  Copyright © 2018年 戴运鹏. All rights reserved.
//

#import <Foundation/Foundation.h>
#include <stdio.h>
//O(N²)
//每次比较两个相邻的元素，如果他们的顺序错误就把他们交换过来、
//如果有n 个数进行排序，只需将n-1 个数归位，也就是说要进行n-1 趟操作

struct stu{
    char name[21];
    char score;
};
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        struct stu a[100],t;
        int i , j , n;
        printf("请输入");
        scanf("%d",&n);
        for (i = 1; i <= n; i++) {
            printf("请输");
            scanf("%s  %d",a[i].name,&a[i].score);
        }
        
        for (i = 1; i <=n-1; i++)
        {
            for (j = 1; j <= n-i; j++)
            {
                if (a[j].score < a[j+1].score)
                {
                    t = a[j];
                    a[j] = a[j+1];
                    a[j+1] = t;
                }
            }
        }
        
        for (i = 1; i <= n; i++) {
            printf("%s\n",a[i].name);
        }
        getchar();getchar();
    }
    return 0;
}























