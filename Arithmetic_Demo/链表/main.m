//
//  main.m
//  链表
//
//  Created by 戴运鹏 on 2018/8/7.
//  Copyright © 2018年 戴运鹏. All rights reserved.
//

#import <Foundation/Foundation.h>
struct node
{
    int data;
    struct node *next;
};
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        struct node *head,*p,*q = NULL,*t;
        int i,n,a;
        scanf("%d",&n);
        head = NULL;
        for (i = 1; i<=n; i++) {
            printf("输入:");
            scanf("%d",&a);
            p = (struct node*)malloc(sizeof(struct node));
            p->data = a;
            p->next = NULL;
            if (head == NULL) {
                head = p;
            }else{
                q->next=p;
            }
            q=p;
        }
        t = head;
        
        printf("请输入:");
        scanf("%d",&a);
        while (t!=NULL) {
//            printf("%d",t->data);
//            t = t->next;
            
            if (t->next->data > a) {
                p = (struct node*)malloc(sizeof(struct node));
                p->data = a;
                p->next = t->next;
                t->next = p;
                break;
            }
            t= t->next;
        }
        
        t = head;
        while (t!=NULL) {
            printf("%d",t->data);
            t = t->next;
        }
        getchar();getchar();
    }
    return 0;
}





























