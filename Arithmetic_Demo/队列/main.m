//
//  main.m
//  队列
//
//  Created by 戴运鹏 on 2018/8/7.
//  Copyright © 2018年 戴运鹏. All rights reserved.
//

#import <Foundation/Foundation.h>
//。队列是一种特殊的线性结构，它只允许在队列的首部（head）进行删除操作，这称为“出队”，而在队列的尾部（tail）进行插入操作，这称为“入队”。当队列中没有元素时（即head==tail），称为空队列 FIFO

struct queue{
    int data[100];
    int head;
    int tail;
};

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        int q[102] = {0,6,3,1,7,5,8,9,2,4},head,tail;
        int i;
        head = 1;
        tail = 10;
        while (head < tail) {
            printf("%d ",q[head]);
            head++;
            
            q[tail] = q[head];
            tail++;
            
            head++;
        }
        getchar();getchar();
        //=====
        
        
    }
    return 0;
}

void queueTest()
{
    struct queue q;
    int i;
    q.head = 1;
    q.tail = 1;
    for (i = 1; i <=9; i++) {
        scanf("%d",&q.data[q.tail]);
        q.tail++;
    }
    
    while (q.head < q.tail) {
        printf("%d ",q.data[q.head]);
        q.head++;
        
        q.data[q.tail] = q.data[q.head];
        q.tail++;
        q.head++;
    }
    getchar();getchar();
    
}













































































































