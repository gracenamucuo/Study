//
//  main.m
//  邻接表存储
//
//  Created by 戴运鹏 on 2018/8/12.
//  Copyright © 2018年 戴运鹏. All rights reserved.
//

#import <Foundation/Foundation.h>
//N顶点数，M边数   对于边数M少于N²的稀疏图可以用邻接表表示
/*
 4 5
 1 4 9
 2 4 6
 1 2 5
 4 3 8
 1 3 7
 
 */

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        //邻接表存储
        int n,m,i;
        int u[6],v[6],w[6];//要比m的最大值大一
        //first和n的最大值要比n的最大值大一。
        int first[5],next[5];
        scanf("%d %d",&n,&m);
        for (i = 1; i<= n; i++) {
            first[i] = -1;//表示1~n顶点暂时没有边
        }
        
        for (i = 1; i <= m; i++) {
            scanf("%d %d %d",&u[i],&v[i],&w[i]);
            next[i] = first[u[i]];
            first[u[i]] = i;
        }
        //最终：first数组的1~n号单元格分别用来存储1~n号顶点的第一条边的编号。初始的时候因为没有边所以都是-1。即first[u[i]]保存顶点u[i]的第一条边的编号。next[i]存储“编号为i的边”的“下一条边”的编号。
        
        
        for (i = 1; i<=n; i++) {
            k = first[i];
            while (k != -1) {
                printf("%d %d %d\n",u[k],v[k],w[k]);
                k = next[k];
            }
        }
    }
    return 0;
}






































































































































































