//
//  ViewController.m
//  Thread_demo
//
//  Created by 戴运鹏 on 2019/2/20.
//  Copyright © 2019 戴运鹏. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic,copy)NSString *str;
@property (nonatomic,strong)NSLock *lock;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    [NSThread detachNewThreadSelector:@selector(thread1) toTarget:self withObject:nil];
//    [NSThread detachNewThreadSelector:@selector(thread2) toTarget:self withObject:nil];
//    self.lock = [[NSLock alloc]init];
    [self sema];
//    [self lockTest];
//    [self conditionLock];
}

- (void)thread1
{
    [self.lock lock];
    for (int i = 0; i < 100000; i++) {
        if (i % 2 == 0) {
            self.str = @"a very long string";
        }else{
            self.str = @"str";
        }
        
    }
    NSLog(@"%@",[NSThread currentThread]);
    [self.lock unlock];
}

- (void)thread2
{
    [self.lock lock];
    if (self.str.length > 10) {
        NSString *sub = [self.str substringWithRange:NSMakeRange(0, 10)];
        
    }
    [self.lock unlock];
    NSLog(@"2  %@",[NSThread currentThread]);
    
    @synchronized (self) {
        
    }
}

//信号量
- (void)sema{
    dispatch_semaphore_t signal = dispatch_semaphore_create(1);
    dispatch_time_t overTime = dispatch_time(DISPATCH_TIME_NOW, 3 * NSEC_PER_SEC);
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        dispatch_semaphore_wait(signal, overTime);//超时时间第2 个参数
        NSLog(@"线程同步操作1 开始");
        sleep(2);
        NSLog(@"线程同步操作1 结束");
    });
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        sleep(1);//在这里 信号量是0 但是由于超时了 会继续走下边的代码
        dispatch_semaphore_wait(signal, overTime);
        NSLog(@"线程同步操作2");
        dispatch_semaphore_signal(signal);
        NSLog(@"啊啊啊啊啊");
    });
}


- (void)lockTest
{
    NSLock *lock = [[NSLock alloc] init];
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        //[lock lock];
        [lock lockBeforeDate:[NSDate date]];
        NSLog(@"需要线程同步的操作1 开始");
        sleep(2);
        NSLog(@"需要线程同步的操作1 结束");
        [lock unlock];
        
    });
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        sleep(1);
        if ([lock tryLock]) {//尝试获取锁，如果获取不到返回NO，不会阻塞该线程
            NSLog(@"锁可用的操作");
            [lock unlock];
        }else{
            NSLog(@"锁不可用的操作");
        }
        
        NSDate *date = [[NSDate alloc] initWithTimeIntervalSinceNow:3];
        if ([lock lockBeforeDate:date]) {//尝试在未来的3s内获取锁，并阻塞该线程，如果3s内获取不到恢复线程, 返回NO,不会阻塞该线程
            NSLog(@"没有超时，获得锁");
            [lock unlock];
        }else{
            NSLog(@"超时，没有获得锁");
        }
        
    });
}

- (void)recursiveTest
{
    //NSLock *lock = [[NSLock alloc] init];
    NSRecursiveLock *lock = [[NSRecursiveLock alloc] init];
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        
        static void (^RecursiveMethod)(int);
        
        RecursiveMethod = ^(int value) {
            
            [lock lock];
            if (value > 0) {
                
                NSLog(@"value = %d", value);
                sleep(1);
                RecursiveMethod(value - 1);
            }
            [lock unlock];
        };
        
        RecursiveMethod(5);
    });
}

- (void)conditionLock
{
    NSConditionLock *lock = [[NSConditionLock alloc]init];
    NSMutableArray *products = [NSMutableArray array];
    
   NSInteger HAS_DATA = 1;
    NSInteger NO_DATA = 0;
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        while (1) {
            [lock lockWhenCondition:NO_DATA];
            [products addObject:[[NSObject alloc] init]];
            NSLog(@"produce a product,总量:%zi",products.count);
            [lock unlockWithCondition:HAS_DATA];
            sleep(1);
        }
        
    });
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        while (1) {
            NSLog(@"wait for product");
            [lock lockWhenCondition:HAS_DATA];
            [products removeObjectAtIndex:0];
            NSLog(@"custome a product");
            [lock unlockWithCondition:NO_DATA];
        }
        
    });
}

- (void)conditionTest
{
    NSCondition *condition = [[NSCondition alloc] init];
    
    NSMutableArray *products = [NSMutableArray array];
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        while (1) {
            [condition lock];
            if ([products count] == 0) {
                NSLog(@"wait for product");
                [condition wait];
            }
            [products removeObjectAtIndex:0];
            NSLog(@"custome a product");
            [condition unlock];
        }
        
    });
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        while (1) {
            [condition lock];
            [products addObject:[[NSObject alloc] init]];
            NSLog(@"produce a product,总量:%zi",products.count);
            [condition signal];
            [condition unlock];
            sleep(1);
        }
        
    });
}
@end
