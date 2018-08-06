//
//  main.m
//  快速排序
//
//  Created by 戴运鹏 on 2018/8/6.
//  Copyright © 2018年 戴运鹏. All rights reserved.
//

#import <Foundation/Foundation.h>
#include <stdio.h>
//平均时间复杂度O(NlogN)  最大时间复杂度O(N²)

int a[101],n;
void  quicksort(int left,int right)
{
    int i,j,t,temp;
    if(left > right)
    {
        return;
    }
    temp= a[left];
    i = left;
    j = right;
    while (i != j)
    {
        while (a[j] >= temp && i < j)
            j--;
            
        while (a[i]<=temp &&i<j)
                i++;
        
                if (i < j) {
                    t = a[i];
                    a[i] = a[j];
                    a[j] = t;
                }
    }
    
    a[left] = a[i];
    a[i]=temp;
    quicksort(left, i-1);
    quicksort(i+1, right);
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {

    }
    return 0;
}
