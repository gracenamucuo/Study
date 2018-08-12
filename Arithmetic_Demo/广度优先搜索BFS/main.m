//
//  main.m
//  广度优先搜索BFS
//
//  Created by 戴运鹏 on 2018/8/8.
//  Copyright © 2018年 戴运鹏. All rights reserved.
//

#import <Foundation/Foundation.h>

struct note
{
    int x;
    int y;
    int f;
    int s;//步数
};

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        struct note queue[2501];
        int a[51][51] = {0},book[51][51] = {0};
        int next[4][2] = {{0,1},{1,0},{0,-1},{-1,0}};
        int head,tail;
        int i,j,k,n,m,startx,starty,p,q,tx,ty,flag;
        scanf("%d %d",&n,&m);
        for (i = 1; i <= n; i++) {
            for (j = 1; j <= m; j++) {
                scanf("%d",&a[i][j]);
            }
        }
        scanf("%d %d %d %d",&startx,&starty,&p,&q);
        
        head = 1;
        tail = 1;
        queue[tail].x = startx;
        queue[tail].y = starty;
        queue[tail].f = 0;
        queue[tail].s = 0;
        tail++;
        book[startx][starty] = 1;
        flag = 0;
        while (head < tail) {
            for (k = 0; k <= 3; k++) {
                tx = queue[head].x + next[k][0];
                ty = queue[head].y + next[k][1];
                if (tx < 1||tx > n||ty<1 || ty>m) {
                    continue;
                }
                if (a[tx][ty] == 0 && book[tx][ty] == 0) {
                    book[tx][ty] = 1;
                    queue[tail].x = tx;
                    queue[tail].y = ty;
                    queue[tail].f = head;
                    queue[tail].s = queue[head].s + 1;
                    tail++;
                }
                
                if (tx == p && ty == q) {
                    flag = 1;
                    break;
                }
            }
            if (flag == 1) {
                break;
            }
            head++;
            printf("%d",queue[tail - 1].s);
            
            getchar();getchar();
        }
        
        
        
        
        
    }
    return 0;
}





































































































































































































































































