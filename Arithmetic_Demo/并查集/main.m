//
//  main.m
//  并查集
//
//  Created by 戴运鹏 on 2018/8/18.
//  Copyright © 2018年 戴运鹏. All rights reserved.
//

#import <Foundation/Foundation.h>
int f[1000] = {0},n,m,k,sum = 0;
void init()
{
    int i;
    for (i = 1; i<=n; i++) {
        f[i] = i;
    }
}
int getf(int v)
{
    if (f[v] == v) {
        return v;
    }else{
        f[v] = getf(f[v]);
        return f[v];
    }
}

void merge(int v,int u)
{
    int t1,t2;
    t1 = getf(v);
    t2 = getf(u);
    if (t1 != t2) {
        f[t2] = t1;
    }
}
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        int i,x,y;
        scanf("%d %d",&n,&m);
        init();
        for (i = 1; i<=m; i++) {
            scanf("%d %d",&x,&y);
            merge(x, y);
        }
        
        for (i=1; i<=n; i++) {
            if (f[i] == i) {
                sum++;
            }
        }
        getchar();getchar();
        printf("%d\n",sum);
    }
    return 0;
}





















































