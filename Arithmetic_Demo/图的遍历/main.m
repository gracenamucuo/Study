//
//  main.m
//  图的遍历
//
//  Created by 戴运鹏 on 2018/8/11.
//  Copyright © 2018年 戴运鹏. All rights reserved.
//

#import <Foundation/Foundation.h>
//图是由一些顶点和连接这些顶点的边组成。图可以分为有向图和无向图，给图的每条边规定一个方向，那么得到的图称为有向图，其边称为有向边。在有向图中，与一个点相关联的边有出边和入边之分，而与一个有向边关联的两个点也有始点和终点之分。相反，边没有方向的图称为无向图。
//DFS:首先以一个未被访问过的顶点作为起始顶点，沿当前顶点的边走到未访问过的顶点；当没有未访问过的顶点时，则回到上一个顶点，继续试探访问别的顶点。直到所有的顶点都被访问过。【DFS是沿着图的某一条分支遍历直到末端，然后回溯，再沿着另一条进行同样的变量，直到所有的顶点都被访问过为止】

//BFS:首先以一个未被访问过的顶点作为起始顶点，访问其所有相邻的顶点，然后对每个相邻的顶点，再访问他们相邻的未被访问过的顶点，直到所有的顶点都被访问过。


int book[101],sum,n,e[101][101];

void dfs(int cur)
{
    int i;
    printf("%d",cur);
    sum++;
    if (sum == n) {
        return;
    }
    for (i = 1; i<= n; i++) {
        if (e[cur][i] == 1 && book[i] == 0) {
            book[i] = 1;
            dfs(i);
        }
    }
}
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        int i,j,m,a,b;
        scanf("%d %d",&n,&m);
        for (i = 1; i<= n; i++) {
            for (j = 1; j <= n; j++) {
                if (i == j) {
                    e[i][j] = 0;
                }else{
                    e[i][j] = 99999999;
                }
            }
        }
        
        for (i = 1; i<= m; i++) {
            scanf("%d %d",&a,&b);
            e[a][b] = 1;
            e[b][a] = 1;
        }
        
        book[1] = 1;
        dfs(1);
        getchar();getchar();
    }
    return 0;
}

//
void bfs()
{
    int i,j,n,m,a,b,cur,book[101] = {0},e[101][101];
    int queue[100001],head,tail;
    scanf("%d %d",&n,&m);
    for (i = 1; i<=n; i++) {
        for (j = 1; j<= n; j++) {
            if (i == j) {
                e[i][j] =0 ;
            }else{
                e[i][j] = 99999999;
            }
        }
        for (i = 1; i<=m; i++) {
            scanf("%d %d",&a,&b);
            e[a][b] = 1;
            e[b][a] = 1;
        }
        head = 1;tail = 1;
        queue[tail] = 1;
        tail++;
        book[1] = 1;
        
        while (head < tail) {
            cur = queue[head];
            for (i = 1; i<=n; i++) {
                if (e[cur][i] == 1 && book[i] ==0) {
                    queue[tail] = i;
                    tail++;
                    book[i] = 1;
                }
                if (tail > n) {
                    break;
                }
            }
            head++;
        }
        for (i = 1; i < tail; i++) {
            printf("%d",queue[i]);
        }
        getchar();getchar();
    }
}

































