//
//  main.m
//  最短路径
//
//  Created by 戴运鹏 on 2018/8/11.
//  Copyright © 2018年 戴运鹏. All rights reserved.
//

#import <Foundation/Foundation.h>
/*
    1   2   3   4

1   0   2   6   4
 
2   ∞   0   3   ∞
 
3   7   ∞   0   1
 
4   5   ∞   12  0
 
 
 */
//可以借助第三点来取两点之间的最短路径  当两点之间不允许经过第三个点时，这两点之间的最短路径就是这两点之间的初始路程。

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        int e[10][10],k,i,j,n,m,t1,t2,t3;
        int inf = 99999999;
        scanf("%d %d",&n,&m);
        for (i = 1; i<=n; i++) {
            for (j = 1; j <= n; j++) {
                if (i == j) {
                    e[i][j] = 0;
                }else{
                    e[i][j] = inf;
                }
            }
        }
        
        for (i = 1; i<= m; i++) {
            scanf("%d %d %d",&t1,&t2,&t3);
            e[t1][t2] = t3;
        }
       
        //Floyd-Warshall算法核心 不能解决带有“负权回路”的图。一个图中带有"负权回路"。该图中就没有最短路径。
        for (k = 1; k<=n; k++) {
            for (i = 1; i<=n; i++) {
                for (j = 1; j <= n; j++) {
                    if (e[i][j] > e[i][k] + e[k][j]) {
                        e[i][j] = e[i][k] + e[k][j];
                    }
                }
            }
        }
        
        for (i = 1; i<= n; i++) {
            for (j = 1; j <= n; j++) {
                printf("%10d",e[i][j]);
            }
            printf("\n")
        }
    }
    return 0;
}










































































































































































