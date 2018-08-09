//
//  main.m
//  深度优先搜索
//
//  Created by 戴运鹏 on 2018/8/8.
//  Copyright © 2018年 戴运鹏. All rights reserved.
//

#import <Foundation/Foundation.h>
int a[10],book[10],n;//C的全局变量在没有赋值以前默认是0。
//深度优先搜索的关键在于解决“当下该如何做”，“下一步如何做”就是和“当下如何做”是一样的
void dfs(int step)
{
    int i;
    if (step == n + 1) {
        for (i = 1; i<=n; i++) {
//            printf("%d",a[i]);
        }
//        printf("\n");
        return;
    }
    
    for (i = 1; i <= n; i++) {
        if (book[i] == 0) {
            a[step] = i;
            book[i] = 1;
            
            dfs(step + 1);
           
            book[i] = 0;//本次尝试成功后，就将本次的尝试清空。
//            printf("%d清空\n",i);
        }
    }
    
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        scanf("%d",&n);
        time_t old,now;
        time(&old);
        dfs(1);
        time(&now);
        printf("%ld   %ld",now,old);
        getchar();getchar();
    }
    return 0;
}

/*
 void dfs(int step)
 {
    判断边界
    尝试每一种可能
 for(i = 1;i<=n;i++)
 {
    继续下一步 dfs(step + 1);
 }
    返回
 }
 */












































