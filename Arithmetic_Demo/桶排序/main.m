//
//  main.m
//  桶排序
//
//  Created by 戴运鹏 on 2018/8/6.
//  Copyright © 2018年 戴运鹏. All rights reserved.
//

#import <Foundation/Foundation.h>
#include <stdio.h>
int main(int argc, const char * argv[]) {
    //时间复杂度是O(M + N)
    @autoreleasepool {
        int book[1001],i,j,t,n;
        for (i = 0; i <= 1000; i++) {
            book[i] = 0;
        }
        printf("请输入:");
        scanf("%d",&n);
        
        for (i = 1; i <= n; i++) {
            printf("请输");
            scanf("%d",&t);
            book[t]++;
        }
        
        for (i = 1000; i >= 0; i--) {
            for (j = 1; j<= book[i]; j++) {
                
                printf("%d\n",i);
            }
        }
        
        getchar();getchar();
        
    }
    return 0;
}
























