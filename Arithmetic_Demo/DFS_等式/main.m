//
//  main.m
//  DFS_等式
//
//  Created by 戴运鹏 on 2018/8/8.
//  Copyright © 2018年 戴运鹏. All rights reserved.
//

#import <Foundation/Foundation.h>//两个三位数相加 等于另一个三位数  从1-9中取数
    int a[10],book[10],total = 0;
void dfs(int step)
{
    int i;
    if (step == 10) {
        if (a[1]*100 + a[2]*10 + a[3] + a[4]*100 + a[5]*10 + a[6] == a[7] *100 +a[8]*10 + a[9]) {
            total++;
            printf("%d%d%d+%d%d%d=%d%d%d",a[1],a[2],a[3],a[4],a[5],a[6],a[7],a[8],a[9]);
        }
        return;
    }
    
    for (i = 1; i<=9; i++) {
        if (book[i] == 0) {
            a[step] = i;
            book[i] = 1;
            dfs(step + 1);
            book[i] = 0;
        }
    }
    return;
}
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        dfs(1);
        printf("total = %d",total / 2);
        getchar();getchar();
    }
    return 0;
}
























































































































































