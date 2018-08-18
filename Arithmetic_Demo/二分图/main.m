//
//  main.m
//  二分图
//
//  Created by 戴运鹏 on 2018/8/18.
//  Copyright © 2018年 戴运鹏. All rights reserved.
//

#import <Foundation/Foundation.h>
//二分图:如果一个图的所有顶点可以被分为X和Y两个集合，并且所有边的两个顶点恰好一个属于集合X,另一个属于集合Y，即每个集合内的顶点没有边相连，此图就是二分图
int e[101][101];
int match[101];
int book[101];
int n,m;
int dfs(int u)
{
    int i;
    for (i = 1; i<=n; i++) {
        if (book[i] == 0 && e[u][i] == 1) {
            book[i] = 1;
            if (match[i] == 0 || dfs(match[i])) {
                match[i] = u;
                match[u] = i;
                return 1;
            }
        }
    }
    return 0;
}
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        int i,j,t1,t2,sum = 0;
        scanf("%d %d",&n,&m);
        for (i = 1; i<= m; i++) {
            scanf("%d %d",&t1,&t2);
            e[t1][t2] = 1;
            e[t2][t1] = 1;
        }
        for (i = 1; i<=n; i++) {
            match[i] = 0;
        }
        for (i = 1; i<= n; i++) {
            for (j = 1; j<=n; j++) {
                book[j] = 0;
                if (dfs(i)) {
                    sum++
                }
            }
        }
        printf("%d",sum);
        getchar();getchar();
    }
    return 0;
}
























































































































































































