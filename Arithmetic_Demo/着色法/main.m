//
//  main.m
//  着色法
//
//  Created by 戴运鹏 on 2018/8/11.
//  Copyright © 2018年 戴运鹏. All rights reserved.
//

#import <Foundation/Foundation.h>
//求小岛面积
struct note
{
    int x;
    int y;
};
int a[51][51];
int book[51][51] = {0},n,m,sum;
void dfs(int x,int y)
{
    int next[4][2] ={{0,1},{1,0},{0,-1},{-1,0}};
    int k,tx,ty;
    for (k =0 ; k<=3; k++) {
        tx = x + next[k][0];
        ty = y + next[k][1];
        if (tx<1||tx > n || ty < 1||ty > m) {
            continue;
        }
        if (a[tx][ty] > 0 && book[tx][ty] == 0) {
            sum++;
            book[tx][ty] = 1;
            dfs(tx, ty);
        }
    }
}
int main(int argc, const char * argv[]) {
    @autoreleasepool {
       
    }
    return 0;
}

// DFS
 void dfsTest()
{
    int i,j,startx,starty;
    scanf("%d %d %d %d",&n,&m,&startx,&starty);
    for (i = 1; i<= n; i++) {
        for (j = 1; j<=n; j++) {
            scanf("%d",&a[i][j]);
        }
    }
    book[startx][starty] = 1;
    sum = 1;
    dfs(startx, starty);
    printf("%d\n",sum);
    getchar();getchar();
    
}



//BFS
 void bfsTest()
{
    struct note quequ[2501];
    int head,tail;
    int a[51][51];
    int book[51][51] = {0};
    int i,j,k,sum,max = 0,mx,my,n,m,startx,starty,tx,ty;
    int next[4][2] ={{0,1},{1,0},{0,-1},{-1,0}};
    scanf("%d %d %d %d ",&n,&m,&startx,&starty);
    for (i = 1;i<=n;i++)
    {
        for (j = 1;j<=n;j++)
        {
             scanf("%d",&a[i][j]);
        }
    }
    head = 1;
    tail = 1;
    quequ[tail].x = startx;
    quequ[tail].y = starty;
    tail++;
    book[startx][starty] = 1;
    sum = 1;
    while (head < tail) {
        for (k = 0; k<= 3; k++) {
            tx = quequ[head].x + next[k][0];
            ty = quequ[head].y + next[k][1];
            if (tx < 1||tx> n||ty < 1||ty > m) {
                continue;
            }
            if (a[tx][ty] > 0 && book[tx][ty] == 0) {
                sum++;
                book[tx][ty] = 1;
                quequ[tail].x = tx;
                quequ[tail].y = ty;
                tail++;
            }
        }
        head++;
    }
    printf("%d\n",sum);
    getchar();getchar();
    
}












































