//
//  main.m
//  树
//
//  Created by 戴运鹏 on 2018/8/15.
//  Copyright © 2018年 戴运鹏. All rights reserved.
//

#import <Foundation/Foundation.h>
//树是指任意两个结点之间有且只有一条路径的无向图。(只要是没有回路的连通无向图就是树)
//满二叉树是一颗深度为h 且有2的h次方-1个结点的二叉树。
//完全二叉树:二叉树高度为h，除了第h层外，其他各层的结点数都达到最大个数，第h层从右向左连续缺若干结点，则为完全二叉树。 完全二叉树的一个父节点编号为k，他的左儿子的编号为2*k,右儿子的编号是2*k + 1。如果儿子的编号x（左或右），父节点的编号为x/2。共有N个结点的完全二叉树，的高度为logN。
//完全二叉树的一个性质:最后一个非叶节点是第n/2个节点。

//
int h[101];
int n;

void swap(int x,int y)
{
    int t;
    t = h[x];
    h[x] = h[y];
    h[y] = t;
}
void siftdown(int i)
{
    int t,flag = 0;
    while (i*2 <= n && flag == 0)
    {
        if (h[i] > h[2*i]) {//左二子
            t = 2*i;
        }else{
            t = i;
        }
        if (i*2 + 1<=n) {//右节点
            if (h[t] > h[i*2 + 1]) {
                t = i*2+1;
            }
        }
        
        if (t!=i) {
            swap(t, i);
            i = t;
        }else{
            flag = 1;
        }
    }
}

void create()
{
    int i;
    for (i = n / 2; i>=1; i--) {
        siftdown(i);
    }
}

int deleteMax()
{
    int t;
    t = h[1];
    h[1] = h[n];
    n--;
    siftdown(1);//之后再将堆排位最小堆
    return t;//每一次把堆顶的最小数返回，放入一个从小到大排序的数组、
}

//堆排序
void heapSort()
{
    while (n > 1) {
        swap(1, n);
        n--;
        siftdown(1);
    }
}

void createFromK(int k){
    int i;
    for (i = (n-k)/ 2; i>=1; i--) {
        siftdown(i);
    }
}

void findK_max(int k)
{
    int i,num;
    scanf("%d",&num);
    for (i = 1; i<=num; i++) {
        scanf("%d",&h[i]);
    }
    n = num;
    createFromK(k);
    int m = k+1;
    while (m<=num) {
        if (h[1]<h[m]) {
            swap(1, m);
        }
        m++;
        createFromK(k);
    }
    printf("%d",h[1]);
    
}
int main(int argc, const char * argv[]) {
    
    @autoreleasepool {
//        int i,num;
//        scanf("%d",&num);
//        for (i = 1; i<=num; i++) {
//            scanf("%d",&h[i]);
//        }
//        n = num;
//        create();
////        for (i = 1; i<= num; i++) {
////            printf("%d",deleteMax());
////        }
//
//        heapSort();
//
//
//        for (i = 1; i<=num; i++) {
//            printf("%d\n",h[i]);
//        }
//        getchar();getchar();
        
        findK_max(4);
    }
    return 0;
}



//求一个数列中第K大的数，只需要建立一个大小为K的最小堆，堆顶就是第K大的数。
//求一个数列中第K小的数，只需要建立一个大小为K的最大堆，堆顶就是第K小的数。























































































































