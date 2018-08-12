//
//  main.m
//  图的BFS遍历
//
//  Created by 戴运鹏 on 2018/8/11.
//  Copyright © 2018年 戴运鹏. All rights reserved.
//


//BFS更适用于所有边的权值相同的情况。例如:求最短路径的时候，每条边的距离相当于权值。所有用DFS更合适。

#import <Foundation/Foundation.h>
/*

    1   2   3   4   5
1   0   1   1   0   0
 
2   1   0   1   1   0
 
3   1   1   0   1   1
 
4   0   1   1   0   1
 
5   0   0   1   1   0

 
 
 
 */

struct note
{
    int x;
    int s;
};

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        struct note que[2501];
        int e[51][51] = {0};
       int book[51] = {0};
        int head,tail;
        int i,j,n,m,a,b,cur,start,end,flag = 0;
        scanf("%d %d %d %d",&n,&m,&start,&end);
        for (i = 1; i<=n; i++) {
            for (j = 1; j<=n; j++) {
                if (i == j) {
                    e[i][j] = 0;
                }else{
                    e[i][j] = 99999999;
                }
            }
        }
        
        for (i = 1; i<=m; i++) {
            scanf("%d %d",&a,&b);
            e[a][b] = 1;
            e[b][a] = 1;
        }
        head = 1;
        tail = 1;
        
        que[tail].x = start;
        que[tail].s = 0;
        tail++;
        book[1] = start;
        while (head < tail) {
            cur = que[head].x;
            
            for (j = 1; j<= n; j++) {
                if (e[cur][j] != 99999999 && book[j] == 0) {
                    que[tail].x = j;
                    que[tail].s = que[head].s + 1;
                    tail++;
                    book[j] = 1;
                }
                if (que[tail].x == end) {
                    flag = 1;
                    break;
                }
                
            }
            if (flag == 1) {
                break;
            }
            head++;
        }
        printf("%d",que[tail - 1].s);
        getchar();getchar();
    }
    return 0;
}


































