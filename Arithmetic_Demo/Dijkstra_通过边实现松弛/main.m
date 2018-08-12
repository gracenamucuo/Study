//
//  main.m
//  Dijkstra_通过边实现松弛
//
//  Created by 戴运鹏 on 2018/8/12.
//  Copyright © 2018年 戴运鹏. All rights reserved.
//

#import <Foundation/Foundation.h>
//单源最短路径
/*
    1   2   3   4   5   6
 
1   0   1   ∞   ∞   ∞   ∞
 
2   ∞   0   9   3   ∞   ∞
 
3   ∞   ∞   0   ∞   5   ∞
 
4   ∞   ∞   4   0   13  15
 
5   ∞   ∞   ∞   ∞   0   4
 
6   ∞   ∞   ∞   ∞   ∞   0
 */

/*
 每次找到离源点最近的一个顶点，然后以该顶点为中心进行扩展，最终得到源点到其余所有点的最短路径
 */
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        int e[10][10],dis[10],book[10],i,j,n,m,t1,t2,t3,u,v,min;
        int inf = 99999999;
        scanf("%d %d",&n,&m);
        
        for (i = 1; i <= n; i++) {
            for (j = 1; j<=n; j++) {
                if (i == j) {
                    e[i][j] = 0;
                }else{
                    e[i][j] = inf;
                }
            }
        }
        for (i = 1; i <= m; i++) {
            scanf("%d %d %d",&t1,&t2,&t3);
            e[t1][t2] = t3;
        }
        for (i = 1; i <= n; i++) {
            dis[i] = e[1][i];
        }
        for (i = 1; i<=n; i++) {
            book[i] = 0;
        }
        book[1] = 1;
        
        //Dijkstra算法核心
        //先求出所有的顶点到源点的距离，之后找出距离源点最短的距离的顶点，再通过该顶点（min）到其他顶点（other）。如果源点到other的距离大于源点通过min到达other的距离。则替换。
        for (i = 1; i<= n-1; i++) {
            min = inf;
            for (j = 1; j<=n; j++) {
                if (book[j] == 0 && dis[j] < min) {
                    min = dis[j];
                    u = j;
                    printf("u == %d\n   %d",u,min);
                }
            }
            book[u] = 1;
            
            for (v= 1; v<=n; v++) {
                if (e[u][v] < inf) {
                    if (dis[v] > dis[u] + e[u][v]) {
                        dis[v] = dis[u] + e[u][v];
                    }
                }
            }
        }
        for (i = 1; i<= n; i++) {
            printf("%d\n",dis[i]);
        }
        getchar();getchar();
    }
    return 0;
}




































