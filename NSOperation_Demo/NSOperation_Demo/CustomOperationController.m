//
//  CustomOperationController.m
//  NSOperation_Demo
//
//  Created by 戴运鹏 on 2018/3/19.
//  Copyright © 2018年 戴运鹏. All rights reserved.
//

#import "CustomOperationController.h"
#import "CustomOperation.h"
#import "CocurrentOperation.h"
@interface CustomOperationController ()

@end

@implementation CustomOperationController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self cocurrentOpeation];

    
}

- (void)cocurrentOpeation//手动执行的并发操作。
{
    [self cocurrentInMain];
}

- (void)cocurrentInMain
{
    CocurrentOperation *op = [[CocurrentOperation alloc]init];
    [op start];
}


- (void)nonCocurrentOperation//手动执行操作不并发执行，但是可以和操作队列结合实现并发。
{
    //    [self executeInMain];
    //
    //    [self executeInNewThread];
    
    
    //    [self addMainQueue];
    
    //    [self addCustomQueue];
}

//************************不加入队列*********************************

- (void)executeInMain
{
    CustomOperation *op = [[CustomOperation alloc]initWithData:@""];
    [op start];
}

- (void)executeInNewThread
{
    [NSThread detachNewThreadSelector:@selector(executeInMain) toTarget:self withObject:nil];
}

//************************加入队列*********************************

- (void)addMainQueue
{
    NSOperationQueue *mainQueue = [NSOperationQueue mainQueue];
    CustomOperation *op1 = [[CustomOperation alloc]initWithData:@"1"];
    CustomOperation *op2 = [[CustomOperation alloc]initWithData:@"2"];
    CustomOperation *op3 = [[CustomOperation alloc]initWithData:@"3"];
    
    [mainQueue addOperation:op1];
    [mainQueue addOperation:op2];
    [mainQueue addOperation:op3];
}

- (void)addCustomQueue
{
    NSOperationQueue *customQueue = [[NSOperationQueue alloc]init];
    CustomOperation *op1 = [[CustomOperation alloc]initWithData:@"1"];
    CustomOperation *op2 = [[CustomOperation alloc]initWithData:@"2"];
    CustomOperation *op3 = [[CustomOperation alloc]initWithData:@"3"];
    
    [customQueue addOperation:op1];
    [op1 cancel];
    [customQueue addOperation:op2];
    [customQueue addOperation:op3];
}

//************************加入队列*********************************
@end


































