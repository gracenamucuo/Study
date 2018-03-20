//
//  NSBlockOperationController.m
//  NSOperation_Demo
//
//  Created by 戴运鹏 on 2018/3/19.
//  Copyright © 2018年 戴运鹏. All rights reserved.
//

#import "NSBlockOperationController.h"

@interface NSBlockOperationController ()

@end

@implementation NSBlockOperationController

- (void)viewDidLoad {
    [super viewDidLoad];
    //不加入队列
//                [self executeInMainThread];
//                [self executeInNewThread];
    //加入队列
//                    [self addMainOperationQueue];
//                    [self addCustomOperationQueue];
    
    //加依赖关系
//                        [self addDependenceInMain];
                        [self addDependenceInCustom];
}
//*******************************不加入队列***************************************

- (void)executeInMainThread
{
    NSLog(@"创建操作:%@",[NSThread currentThread]);
    NSBlockOperation *op = [NSBlockOperation blockOperationWithBlock:^{
        [self task];
    }];
    //NSBlockOperation该操作有个方法能在该操作中持续添加操作任务addExecutionBlock，直到全部的block中的任务都执行完成后，该操作op才算执行完毕。当该操作在addExecutionBlock加入比较多的任务时，该op的block中的（包括blockOperationWithBlock和addExecutionBlock中的操作）会在新开的线程中执行。不一定在创建该op的线程中执行。
    [op addExecutionBlock:^{
        [self task:@"add"];
    }];
    [op addExecutionBlock:^{
        [self task:@"add"];
    }];
    [op addExecutionBlock:^{
        [self task:@"add"];
    }];
    [op addExecutionBlock:^{
        [self task:@"add"];
    }];
    [op addExecutionBlock:^{
        [self task:@"add"];
    }];
    [op addExecutionBlock:^{
        [self task:@"add"];
    }];
    [op addExecutionBlock:^{
        [self task:@"add"];
    }];
    [op addExecutionBlock:^{
        [self task:@"add"];
    }];
    [op start];
}

- (void)executeInNewThread
{
    [NSThread detachNewThreadSelector:@selector(executeInMainThread) toTarget:self withObject:nil];
}

- (void)task
{
    for (NSInteger i = 0; i < 3; i++) {
        NSLog(@"操作执行:%@",[NSThread currentThread]);
    }
}

//*******************************加入队列***************************************

- (void)addMainOperationQueue
{
    NSLog(@"任务创建:%@",[NSThread currentThread]);
    NSOperationQueue *mainQueue = [NSOperationQueue mainQueue];
    NSBlockOperation *op1 = [NSBlockOperation blockOperationWithBlock:^{
        [self task:@"1"];
    }];

    NSBlockOperation *op2 = [NSBlockOperation blockOperationWithBlock:^{
        [self task:@"2"];
    }];

    NSBlockOperation *op3 = [NSBlockOperation blockOperationWithBlock:^{
        [self task:@"3"];
    }];
 
    [mainQueue addOperation:op1];
    [mainQueue addOperation:op2];
    [mainQueue addOperation:op3];
    
    
    [op1 addExecutionBlock:^{
        [self task:@"1.1"];
    }];
    [op1 addExecutionBlock:^{
        [self task:@"1.1"];
    }];
    [op1 addExecutionBlock:^{
        [self task:@"1.1"];
    }];
    [op1 addExecutionBlock:^{
        [self task:@"1.1"];
    }];
    [op1 addExecutionBlock:^{
        [self task:@"1.1"];
    }];
    [op1 addExecutionBlock:^{
        [self task:@"1.1"];
    }];
    [op1 addExecutionBlock:^{
        [self task:@"1.1"];
    }];[op1 addExecutionBlock:^{
        [self task:@"1.1"];
    }];
    [op1 addExecutionBlock:^{
        [self task:@"1.1"];
    }];
    [op2 addExecutionBlock:^{
        [self task:@"2.1"];
    }];
    [op3 addExecutionBlock:^{
        [self task:@"3.1"];
    }];
    //将操作加入到主队列中后，根据操作添加到队列中的先后顺序(操作之间没有添加依赖关系)，串行执行。每个操作addExecutionBlock添加的任务和blockOperationWithBlock中的任务共同组成一个操作。两个block中的操作都执行结束后，一个操作才算结束。
    //虽然将操作加到了NSOperationQueue主操作队列，但是当操作中addExecutionBlock加的任务比较多的时候，block中的任务会在新的线程中执行。
}

- (void)addCustomOperationQueue
{
    NSLog(@"任务创建:%@",[NSThread currentThread]);
    NSOperationQueue *customQueue = [[NSOperationQueue alloc]init];
    customQueue.maxConcurrentOperationCount = 1;
    NSBlockOperation *op1 = [NSBlockOperation blockOperationWithBlock:^{
        [self task:@"1"];
    }];
    
    NSBlockOperation *op2 = [NSBlockOperation blockOperationWithBlock:^{
        [self task:@"2"];
    }];
    
    NSBlockOperation *op3 = [NSBlockOperation blockOperationWithBlock:^{
        [self task:@"3"];
    }];
    
    
    [customQueue addOperation:op1];
    [customQueue addOperation:op2];
    [customQueue addOperation:op3];
    [op1 addExecutionBlock:^{
        [self task:@"1.1"];
    }];
    
}

- (void)task:(NSString *)order
{
    for (NSInteger i = 0; i < 3; i++) {
        NSLog(@"任务执行%@---%@",order,[NSThread currentThread]);
    }
}


//*******************************添加依赖关系***************************************

- (void)addDependenceInMain
{
    NSLog(@"任务创建:%@",[NSThread currentThread]);
    NSOperationQueue *mainQueue = [NSOperationQueue mainQueue];
    NSBlockOperation *op1 = [NSBlockOperation blockOperationWithBlock:^{
        [self task:@"1"];
    }];
    
    NSBlockOperation *op2 = [NSBlockOperation blockOperationWithBlock:^{
        [self task:@"2"];
    }];
    
    NSBlockOperation *op3 = [NSBlockOperation blockOperationWithBlock:^{
        [self task:@"3"];
    }];
    [op1 addDependency:op2];
    [op2 addDependency:op3];
    //应该把操作的所有配置都配置好后，再加入队列，因为加入队列后，操作就开始执行了，再进行配置就晚了。
    //不能将依赖关系写到加入队列之后。
    [mainQueue addOperation:op1];
    [mainQueue addOperation:op2];
    [mainQueue addOperation:op3];
    
    [op1 addExecutionBlock:^{
        [self task:@"1.1"];
    }];
    
    [op2 addExecutionBlock:^{
        [self task:@"2.1"];
    }];
    
    [op3 addExecutionBlock:^{
        [self task:@"3.1"];
    }];
    

}

- (void)addDependenceInCustom
{
    NSLog(@"任务创建:%@",[NSThread currentThread]);
    NSOperationQueue *customQueue = [[NSOperationQueue alloc]init];
    NSBlockOperation *op1 = [NSBlockOperation blockOperationWithBlock:^{
        [self task:@"1"];
    }];
    
    NSBlockOperation *op2 = [NSBlockOperation blockOperationWithBlock:^{
        [self task:@"2"];
    }];
    
    NSBlockOperation *op3 = [NSBlockOperation blockOperationWithBlock:^{
        [self task:@"3"];
    }];
    
    [op1 addDependency:op2];
    [op3 addDependency:op1];
    [customQueue addOperation:op1];
    [customQueue addOperation:op2];
    [customQueue addOperation:op3];
    [op1 addExecutionBlock:^{
        [self task:@"1.1"];
    }];
}

- (void)dealloc
{
    NSLog(@"%@ dealloc",NSStringFromClass([self class]));
}
@end











