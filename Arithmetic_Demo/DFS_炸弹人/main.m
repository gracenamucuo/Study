//
//  main.m
//  DFS_炸弹人
//
//  Created by 戴运鹏 on 2018/8/11.
//  Copyright © 2018年 戴运鹏. All rights reserved.
//

#import <Foundation/Foundation.h>
char a[20][21];
int book[20][20],max,mx,my,n,m;
int getnum(int i,int j)
{
    int sum ,x ,y;
    sum = 0;
    x = i;y = j;
    //向上统计
    while (a[x][y] != '#') {
        if (a[x][y] == 'G') {
            sum++;
        }
        x--;
    }
    //向下统计
    x=i;y = j;
    while (a[x][y] !='#') {
        if (a[x][y]=='G') {
            sum++;
        }
        x++;
    }
    //向左
    x= i;y = j;
    while (a[x][y] !='#') {
        if (a[x][y]=='G') {
            sum++;
        }
        y--;
    }
    //向右
    x=i;y=j;
    while (a[x][y]!='#') {
        if (a[x][y]=='G') {
            sum++;
        }
        y++;
    }
    return sum;
}

void dfs(int x,int y)
{
    int next[4][2] ={{0,1},{1,0},{0,-1},{-1,0}};
    int k,sum,tx,ty;
    sum = getnum(x, y);
    if (sum > max) {
        max = sum;
        mx = x;
        my = y;
    }
    for (k = 0; k<=3; k++) {
        tx = x + next[k][0];
        ty = y + next[k][1];
        if (tx < 0 ||tx > n - 1 || ty < 0||ty > m - 1) {
            continue;
        }
        if (a[tx][ty] == '.' && book[tx][ty] == 0) {
            book[tx][ty] =1;
            dfs(tx, ty);
        }
    }
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        int i,startx,starty;
        scanf("%d %d %d %d ",&n,&m,&startx,&starty);
        for (i = 0; i<= n -1; i++) {
            scanf("%s",a[i]);
        }
        book[startx][starty] = 1;
        max = getnum(startx, starty);
        mx = startx;
        my = starty;
        dfs(startx, starty);
        printf("将炸弹放在(%d,%d),最多可以消灭%d个敌人",mx,my,max);
        getchar();getchar();
    }
    return 0;
}



















































































































































































































































































































