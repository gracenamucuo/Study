//
//  main.m
//  Bellman_Ford_解决负权边
//
//  Created by 戴运鹏 on 2018/8/12.
//  Copyright © 2018年 戴运鹏. All rights reserved.
//

#import <Foundation/Foundation.h>
//第1轮在对所有的边进行松弛之后，得到的是从1号顶点“只能经过一条边”到达其余各顶点的最短路径长度。第2轮在对所有的变进行松弛之后，得到的是从1号顶点“最多经过两条边”到达其余各顶点的最短路径长度。……只需要进行n-1轮就行了。
//最短路径肯定是一个不包含回路的简单路径。回路分为正权回路(回路权值之和为正)，和负权回路(回路权值之和为负数)
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        int dis[10],bark[10],i,k,n,m,u[10],v[10],w[10],check,flag;
        int inf= 99999999;
        scanf("%d %d",&n,&m);
        for (i = 1; i<=m; i++) {
            scanf("%d %d %d",&u[i],&v[i],&w[i]);
        }
        for (i = 1; i<= n; i++) {
            dis[i] = inf;
        }
        dis[1] = 0;
        
    //核心算法
        for (k = 1; k<=n- 1; k++) {
            
            for (i = 1; i<=n; i++) {
                bark[i] = dis[i];
            }
            
            for (i = 1; i<= m; i++) {
                if (dis[v[i]]>dis[u[i]] + w[i]) {
                    dis[v[i]] = dis[u[i]] + w[i];
                }
            }
            check = 0;
            for (i = 1; i<=n; i++) {
                if (bark[i] != dis[i]) {
                    check = 1;break;
                }
            }
            if (check == 0) {
                break;
            }
 
        }
         //松弛后，还有可以松弛的，说明有负权回路
        flag = 0;
        for (i = 1; i<= m; i++) {
            if (dis[v[i]>dis[u[i]]+w[i]) {
                flag = 1;
            }
        }
                    if(flag == 1){
                        printf("含有负权回路");
                    }else{
                        for(i = 1;i<=n;i++){
                            printf("%d",dis[i]);
                        }
                    }
                    
                    
                    getchar(); getchar();
        
    }
    return 0;
}






















































































































































































































