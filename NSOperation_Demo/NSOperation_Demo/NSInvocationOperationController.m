//
//  NSInvocationOperationController.m
//  NSOperation_Demo
//
//  Created by 戴运鹏 on 2018/3/19.
//  Copyright © 2018年 戴运鹏. All rights reserved.
//

#import "NSInvocationOperationController.h"

@interface NSInvocationOperationController ()
@property (nonatomic,strong)NSOperationQueue *mainQueue;
@end

@implementation NSInvocationOperationController

- (void)viewDidLoad {
    [super viewDidLoad];
    //不加入队列*************
                   //主线程
//                [self executeInMainThread];
//                    //子线程
//                [self executeInNewThread];
    //加入队列*************
//    [NSThread detachNewThreadSelector:@selector(addMainOperationQueue) toTarget:self withObject:nil];
                [self addMainOperationQueue];
//                [self addCustomeOperationQueue];
    //操作依赖*************
//                [self addDependenceInMain];
//                [self addDependenceInCustom];
}

//*******************************不加入队列***************************************
/**
 在主线程中执行
 */
- (void)executeInMainThread
{
    NSLog(@"创建操作:%@",[NSThread currentThread]);
    NSInvocationOperation *op = [[NSInvocationOperation alloc]initWithTarget:self selector:@selector(task) object:nil];
    [op start];
}

/**
 在子线程中执行
 */
- (void)executeInNewThread
{
    NSLog(@"创建操作:%@",[NSThread currentThread]);
    [NSThread detachNewThreadSelector:@selector(executeInMainThread) toTarget:self withObject:nil];
}

- (void)task
{
    NSLog(@"执行操作:%@",[NSThread currentThread]);
    for (NSInteger i = 0; i < 3; i++) {
        NSLog(@"----%@",[NSThread currentThread]);
    }
}

//*******************************加入队列***************************************

- (void)addMainOperationQueue
{
    NSOperationQueue *mainQueue = [NSOperationQueue mainQueue];
    self.mainQueue = mainQueue;
    NSLog(@"创建添加任务%@",[NSThread currentThread]);
    NSInvocationOperation *op1 = [[NSInvocationOperation alloc]initWithTarget:self selector:@selector(task:) object:@"1"];
    
    NSInvocationOperation *op2 = [[NSInvocationOperation alloc]initWithTarget:self selector:@selector(task:) object:@"2"];
    
    NSInvocationOperation *op3 = [[NSInvocationOperation alloc]initWithTarget:self selector:@selector(task:) object:@"3"];
    
    NSInvocationOperation *op4 = [[NSInvocationOperation alloc]initWithTarget:self selector:@selector(task:) object:@"4"];

//    for (NSInteger i = 0; i < 10; i++) {
//            NSInvocationOperation *op = [[NSInvocationOperation alloc]initWithTarget:self selector:@selector(task:) object:[NSString stringWithFormat:@"1--%ld",i]];
//        [mainQueue addOperation:op];
//    }
    
    [mainQueue addOperation:op1];
    [mainQueue addOperation:op2];
    [mainQueue addOperation:op3];
    
    //    [op3 cancel];//取消某个操作，可以直接调用操作的取消方法cancel。
    //取消整个操作队列的所有操作，这个方法好像没有效果。在主队列中，没有用，如果将操作加入到自定义队列的话，在操作没有开始执行的时候，是能够取消操作的。
    //    [mainQueue cancelAllOperations];
    [mainQueue addOperation:op4];
    
    
}

- (void)addCustomeOperationQueue
{
    NSLog(@"创建添加任务%@",[NSThread currentThread]);
    NSOperationQueue *customQueue = [[NSOperationQueue alloc]init];
     customQueue.maxConcurrentOperationCount = 5;//这个属性的设置需在队列中添加任务之前。任务添加到队列后，如果该任务没有依赖关系的话，任务添加到队列后，会直接开始执行。
    //加入到自定义队列里的任务，可以通过设置操作队列的 maxConcurrentOperationCount的值来控制操作的串行执行还是并发执行。
    
    //当maxConcurrentOperationCount = 1的时候，是串行执行。 maxConcurrentOperationCount > 1的时候是并发执行，但是这个线程开启的数量最终还是由系统决定的，不是maxConcurrentOperationCount设置为多少，就开多少条线程。默认情况下，自定义队列的maxConcurrentOperationCount值为-1，表示并发执行。
    NSInvocationOperation *op1 = [[NSInvocationOperation alloc]initWithTarget:self selector:@selector(task:) object:@"1"];
     [customQueue addOperation:op1];
  
    
    NSInvocationOperation *op2 = [[NSInvocationOperation alloc]initWithTarget:self selector:@selector(task:) object:@"2"];

    
    NSInvocationOperation *op3 = [[NSInvocationOperation alloc]initWithTarget:self selector:@selector(task:) object:@"3"];
    
    
    NSInvocationOperation *op4 = [[NSInvocationOperation alloc]initWithTarget:self selector:@selector(task:) object:@"4"];
    
    //打断点在op1加入队列前后的状态值。
    ///<NSInvocationOperation 0x608000246cf0 isFinished=NO isReady=YES isCancelled=NO isExecuting=NO>
   
    ///<NSInvocationOperation 0x608000246cf0 isFinished=NO isReady=YES isCancelled=NO isExecuting=YES>
  
    [customQueue addOperation:op2];
//    [customQueue cancelAllOperations];//这个方法只能取消还未开始执行的操作，如果操作已经开始执行，那么该方法依然取消不了。
    [customQueue addOperation:op3];
    [customQueue addOperation:op4];
}

- (void)task:(NSString *)order
{
    for (NSInteger i = 0; i < 3; i++) {
        NSLog(@"任务:%@----%@",order,[NSThread currentThread]);
    }
}

//****************************添加依赖*****************************
//依赖关系的设置需要在任务添加到队列之前。
- (void)addDependenceInMain//这个添加依赖的用途有点类似GCD中的队列组
{
    NSOperationQueue *mainQueue = [NSOperationQueue mainQueue];
    NSLog(@"创建添加任务%@",[NSThread currentThread]);
    NSInvocationOperation *op1 = [[NSInvocationOperation alloc]initWithTarget:self selector:@selector(task:) object:@"1"];
    
    
    NSInvocationOperation *op2 = [[NSInvocationOperation alloc]initWithTarget:self selector:@selector(task:) object:@"2"];
 
    
    NSInvocationOperation *op3 = [[NSInvocationOperation alloc]initWithTarget:self selector:@selector(task:) object:@"3"];
    
    
    NSInvocationOperation *op4 = [[NSInvocationOperation alloc]initWithTarget:self selector:@selector(task:) object:@"4"];
    
    [op1 addDependency:op2];//由此更可以看出，如果添加了依赖关系，在主队列串行执行任务，也不是先进先出的规则。而是按照依赖关系的属性执行。  应该把操作的所有配置都配置好后，再加入队列，因为加入队列后，操作就开始执行了，再进行配置就晚了。
    [mainQueue addOperation:op1];
    [mainQueue addOperation:op2];
    [mainQueue addOperation:op3];
    [mainQueue addOperation:op4];
}

- (void)addDependenceInCustom
{
    NSLog(@"创建添加任务%@",[NSThread currentThread]);
    NSOperationQueue *customQueue = [[NSOperationQueue alloc]init];
    customQueue.maxConcurrentOperationCount = 5;
    NSInvocationOperation *op1 = [[NSInvocationOperation alloc]initWithTarget:self selector:@selector(task:) object:@"1"];
    
    NSInvocationOperation *op2 = [[NSInvocationOperation alloc]initWithTarget:self selector:@selector(task:) object:@"2"];
    
    NSInvocationOperation *op3 = [[NSInvocationOperation alloc]initWithTarget:self selector:@selector(task:) object:@"3"];
    
    NSInvocationOperation *op4 = [[NSInvocationOperation alloc]initWithTarget:self selector:@selector(task:) object:@"4"];
    
    //isReady属性如果为YES的时候，该任务处于就绪状态，就等待系统调度执行。如果任务有依赖关系的话，该任务的isReady属性需要在其所属的依赖任务执行完成后，才为YES。
    //默认情况下，操作的queuePriority(队列优先级)为0 NSOperationQueuePriorityNormal 正常优先级。
    //都处于就绪状态下的操作，才开始按照优先级顺序来执行。 优先级高的是说系统调度的概率会大一些，但是也不能确保完全会按照优先级来，如果要设置操作的执行顺序，最有效也最安全的做法还是设置依赖关系。
    [op1 addDependency:op2];
    [op2 addDependency:op3];
    /*注意:两个任务不能相互依赖，如果相互依赖，则会出现死锁，都执行不了
     [op1 addDependency:op2];
     [op2 addDependency:op1];
     这种相互依赖是错误的。
     */
    op1.queuePriority = NSOperationQueuePriorityVeryHigh;
    op4.queuePriority = NSOperationQueuePriorityLow;
    op3.queuePriority = NSOperationQueuePriorityHigh;
    [customQueue addOperation:op1];
    [customQueue addOperation:op2];
    
    [customQueue addOperation:op3];
    [op2 removeDependency:op3];
    [customQueue addOperation:op4];
}

@end













