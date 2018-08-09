//
//  main.m
//  DFS_迷宫
//
//  Created by 戴运鹏 on 2018/8/8.
//  Copyright © 2018年 戴运鹏. All rights reserved.
//

#import <Foundation/Foundation.h>
int n,m,p,q,min = 99999999;
int a[51][51],book[51][51];
void dfs(int x,int y,int step)
{
    int next[4][2] = {{0,1},{1,0},{0,-1},{-1,0}};
    int tx,ty,k;
    if (x==p && y == q) {
        if (step < min) {
            min = step;
            return;
        }
    }
    
    for (k = 0; k<= 3; k++) {
        tx = x + next[k][0];
        ty = y + next[k][1];
        if (tx < 1||tx >n ||ty < 1||ty>m) {
            continue;
        }
        if (a[tx][ty] == 0 && book[tx][ty] == 0) {
            book[tx][ty] = 1;
            dfs(tx, ty, step + 1);
            book[tx][ty] = 0;
        }
    }
    return;
}
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        int i,j,startx,starty;
        scanf("%d  %d",&n,&m);
        
        for (i = 1; i<=n; i++) {
            for (j = 1; j<=m; j++) {
                scanf("%d",&a[i][j]);
            }
        }
        scanf("%d%d%d%d",&startx,&starty,&p,&q);
        book[startx][starty] = 1;
        dfs(startx, starty, 0);
        printf("%d",min);
        getchar();getchar();
        
    }
    return 0;
}















































