//
//  QueueBlockController.m
//  NSOperation_Demo
//
//  Created by 戴运鹏 on 2018/3/20.
//  Copyright © 2018年 戴运鹏. All rights reserved.
//

#import "QueueBlockController.h"

@interface QueueBlockController ()

@end

@implementation QueueBlockController

- (void)viewDidLoad {
    [super viewDidLoad];
//    [self addOperationsInMain];
    
    [self addOperationsInCustom];
}

- (void)addOperationsInMain
{
    [[NSOperationQueue mainQueue]addOperationWithBlock:^{
        [self task:@"main1"];
    }];
    [[NSOperationQueue mainQueue]addOperationWithBlock:^{
        [self task:@"main2"];
    }];
    [[NSOperationQueue mainQueue]addOperationWithBlock:^{
        [self task:@"main3"];
    }];
    [[NSOperationQueue mainQueue]addOperationWithBlock:^{
        [self task:@"main4"];
    }];
    [[NSOperationQueue mainQueue]addOperationWithBlock:^{
        [self task:@"main5"];
    }];
}

- (void)addOperationsInCustom
{
    NSInvocationOperation *op1 = [[NSInvocationOperation alloc]initWithTarget:self selector:@selector(task:) object:@"wait1"];
       NSInvocationOperation *op2 = [[NSInvocationOperation alloc]initWithTarget:self selector:@selector(task:) object:@"wait2"];
       NSInvocationOperation *op3 = [[NSInvocationOperation alloc]initWithTarget:self selector:@selector(task:) object:@"wait3"];
   
       NSInvocationOperation *op4 = [[NSInvocationOperation alloc]initWithTarget:self selector:@selector(task:) object:@"wait4"];
    
    
    NSOperationQueue *customQueue = [[NSOperationQueue alloc]init];

    //第一种:
//    [customQueue addOperation:op1];
//    [op1 waitUntilFinished];//waitUntilFinished是阻塞当前线程的作用，在这里会阻塞主线程，阻塞主线程中继续往队列中加任务，直到该op1操作执行结束，这样就能实现操作的串行了。
//    [customQueue addOperation:op2];
//    [op2 waitUntilFinished];
//    [customQueue addOperation:op3];
//    [op3 waitUntilFinished];
//    [customQueue addOperation:op4];
   
    //第二种: 有点类似GCD中栅栏函数的作用。
    [customQueue addOperations:@[op1,op2] waitUntilFinished:YES];
    [customQueue addOperations:@[op3,op4] waitUntilFinished:YES];
    
}

- (void)task:(NSString *)order
{
    for (NSInteger i = 0; i < 3; i++) {
        NSLog(@"任务执行%@---%@",order,[NSThread currentThread]);
    }
}




@end











