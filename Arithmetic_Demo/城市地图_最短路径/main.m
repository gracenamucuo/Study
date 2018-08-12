//
//  main.m
//  城市地图_最短路径
//
//  Created by 戴运鹏 on 2018/8/11.
//  Copyright © 2018年 戴运鹏. All rights reserved.
//

#import <Foundation/Foundation.h>
/*
    1   2   3   4   5
1   0   2   ∞   ∞   10
 
2   ∞   0   3   ∞   7
 
3   4   ∞   0   4   ∞
 
4   ∞   ∞   ∞   0   5
 
5   ∞   ∞   3   ∞   0
 
 
 
 
 */
int min = 99999999,book[101],n,e[101][101];
void dfs(int cur,int dis)
{
    int j;
    if (dis > min) return;
    
    if (cur == n) {
        if (dis < min) {
            min = dis;
        }
        return;
    }
    
    for (j = 1; j<=n; j++) {
        if (e[cur][j] != 99999999 && book[j] == 0) {
            book[j] = 1;
            dfs(j, dis+e[cur][j]);
            book[j] = 0;
        }
    }
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        int i,j,m,a,b,c;
        scanf("%d %d ",&n,&m);
        for (i = 1; i<=n; i++) {
            for (j = 1; j<=n; j++) {
                if (i == j) {
                    e[i][j] = 0;
                }else{
                    e[i][j] = 99999999;
                }
            }
        }
        
        for (i = 1; i <= m; i++) {
            scanf("%d %d %d",&a,&b,&c);
            e[a][b] = c;
        }
        book[1] = 1;
        dfs(1, 0);
        printf("%d",min);
        getchar();getchar();
    }
    return 0;
}
















































































