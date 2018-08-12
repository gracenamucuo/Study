//
//  main.m
//  BFS_炸弹人
//
//  Created by 戴运鹏 on 2018/8/11.
//  Copyright © 2018年 戴运鹏. All rights reserved.
//

#import <Foundation/Foundation.h>
//BFS 把所有可能的情况都放在队列中，之后对每一种情况进行判断计算

struct note
{
    int x;
    int y;
};
char a[20][21];
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
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        struct note queue[401];
        int head,tail;
        int book[20][20]={0};
        int i,j,k,sum,max=0,mx,my,n,m,startx,starty,tx,ty;
        int next[4][2] ={{0,1},{1,0},{0,-1},{-1,0}};
        scanf("%d %d %d %d",&n,&m,&startx,&starty);
        
        for (i = 0; i<=n-1; i++) {
            scanf("%s",a[i]);
        }
        head= 1;
        tail = 1;
        queue[tail].x = startx;
        queue[tail].y = starty;
        tail++;
        book[startx][starty] = 1;
        max = getnum(startx, starty);
        mx = startx;
        my = starty;
        while (head < tail) {
            for (k=0; k<=3; k++) {
                tx = queue[head].x + next[k][0];
                ty = queue[head].y + next[k][1];
                
                if (tx<0 || tx > n -1 || ty<0 || ty >m - 1) {
                    continue;
                }
                if (a[tx][ty] == '.'&&book[tx][ty] == 0) {
                    book[tx][ty] = 1;
                    queue[tail].x = tx;
                    queue[tail].y = ty;
                    tail++;
                    
                    sum = getnum(tx, ty);
                    if (sum > max) {
                        max = sum;
                        mx = tx;
                        my = ty;
                    }
                }
            }
            head++;
        }
        printf("将炸弹放在(%d,%d)处,消灭%d个敌人",mx,my,max);
        getchar();getchar();
        
    }
    return 0;
}















































































































































































