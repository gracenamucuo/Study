//
//  main.m
//  Bellman_Ford队列优化
//
//  Created by 戴运鹏 on 2018/8/12.
//  Copyright © 2018年 戴运鹏. All rights reserved.
//

#import <Foundation/Foundation.h>
/*
 5 7
 1 2 2
 1 5 10
 2 3 3
 2 5 7
 3 4 4
 4 5 5
 5 3 6
 */
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        int n,m,i,j,k;
        int u[8],v[8],w[8];
        int first[6],next[8];
        int dis[6] = {0},book[6]= {0};
        int que[101] = {0},head = 1,tail = 1;
        int inf = 99999999;
        scanf("%d %d",&n,&m);
        for (i =1; i<=n; i++) {
            dis[i] = inf;
        }
        dis[1] = 0;
        for (i = 1; i<=n; i++) {
            book[i] = 0;
        }
        for (i = 1; i<=n; i++) {
            first[i] = -1;
        }
        for (i = 1; i<=m; i++) {
            scanf("%d %d %d ",&u[i],&v[i],&w[i]);
            next[i] = first[u[i]];
            first[u[i]] = i;
        }
        que[tail] = 1;tail++;
        book[1] = 1;
        while (head<tail) {
            k = first[que[head]];
            while (k!=-1) {
                if (dis[v[k]] > dis[u[k]] + w[k]) {
                    dis[v[k]] = dis[u[k]] + w[k];
                    if (book[v[k]] == 0) {
                        que[tail] = v[k];
                        tail++;
                        book[v[k]] = 1;
                    }
                }
                k = next[k];
            }
            book[que[head]] = 0;
            head++;
        }
        for (i = 1; i<=n; i++) {
            printf("%d\n",dis[i]);
        }
        getchar();getchar();
    }
    return 0;
}

























































































































