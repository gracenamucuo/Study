//
//  OtherController.m
//  GCD_Demo
//
//  Created by 戴运鹏 on 2018/3/15.
//  Copyright © 2018年 戴运鹏. All rights reserved.
//

#import "OtherController.h"

@interface OtherController ()
@property (nonatomic,assign)NSInteger totalTickets;
@end

@implementation OtherController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.totalTickets = 50;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
//该方法一般用来获得单例
- (IBAction)onceAction:(UIButton *)sender {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        //这里的代码只会执行一次。是线程安全的
    });
}
- (IBAction)semaphoneAction:(UIButton *)sender {
    
    dispatch_semaphore_t  semaphore = dispatch_semaphore_create(0);
    //两个函数成对出现。
    //信号量大于0的时候，
    NSLog(@"开始%@",[NSThread currentThread]);
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
   
        for (NSInteger i = 0; i < 3; i++) {
            NSLog(@"任务1%@",[NSThread currentThread]);
        }
         dispatch_semaphore_signal(semaphore);//+1  这里将信号量加1
    });
    
    //当信号量为大于1的时候，继续执行，wait函数会使信号量减1。
    //现在信号量走到这里的话是0，阻塞线程，
    dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER);//-1
    
    NSLog(@"结束%@",[NSThread currentThread]);
}

- (IBAction)semaphoneSafeAction:(UIButton *)sender {
    
//    dispatch_queue_t queue = dispatch_get_global_queue(0, 0);
//    dispatch_semaphore_t semaphore = dispatch_semaphore_create(1);
//
//    for (int i = 0; i < 10; i++) {
//        dispatch_async(queue, ^{
//            // 相当于加锁
//            dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER);
//            NSLog(@"i = %zd semaphore = %@  --- %@", i, semaphore,[NSThread currentThread]);
//
//            // 相当于解锁
//            dispatch_semaphore_signal(semaphore);
//        });
//    }
    
    [self setTicket];
}

- (void)setTicket{
    dispatch_queue_t beijingQueue = dispatch_queue_create("beijing", DISPATCH_QUEUE_SERIAL);
    dispatch_queue_t shanghaiQueue = dispatch_queue_create("shanghai", DISPATCH_QUEUE_SERIAL);
    dispatch_async(beijingQueue, ^{
        NSLog(@"北京%@",[NSThread currentThread]);
//        [self sellTicketNotSafe];
        [self sellTicketSafe];
    });
    
    dispatch_async(shanghaiQueue, ^{
        NSLog(@"上海%@",[NSThread currentThread]);
//        [self sellTicketNotSafe];
        [self sellTicketSafe];
    });
}

- (void)sellTicketNotSafe
{
    while (1) {
        if (self.totalTickets > 0) {
            self.totalTickets--;
            NSLog(@"票数:%ld,--- %@",self.totalTickets,[NSThread currentThread]);
        }else{
            NSLog(@"票卖完了");
            break;
        }
    }
}

- (void)sellTicketSafe
{   dispatch_semaphore_t semaphore = dispatch_semaphore_create(1);
    while (1) {//这里用信号量好像并不能保证线程安全。用了同步锁。
        @synchronized(self){
//                    dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER);
            if (self.totalTickets > 0) {
                
                self.totalTickets--;
                NSLog(@"票数:%ld,--- %@",self.totalTickets,[NSThread currentThread]);
                
            }else{
                NSLog(@"票卖完了%@",[NSThread currentThread]);
//                dispatch_semaphore_signal(semaphore);
                break;
            }
//                    dispatch_semaphore_signal(semaphore);
        }

    }
}

- (IBAction)afterAction:(UIButton *)sender {
    
    CFTimeInterval start = CACurrentMediaTime();
    NSLog(@"****");
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        NSLog(@"-------延时后执行");
        NSLog(@"延时花了: %f ms", (CACurrentMediaTime()-start)*1000);
    });
    NSLog(@"+++++++");
}

- (IBAction)barrierAction:(UIButton *)sender {
    NSLog(@"开始%@",[NSThread currentThread]);
    dispatch_queue_t globalQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_async(globalQueue, ^{
        for (NSInteger i = 0; i < 3; i++) {
            sleep(0.5);
            NSLog(@"任务1----%@",[NSThread currentThread]);
        }
    });
    dispatch_async(globalQueue, ^{
        for (NSInteger i = 0; i < 3; i++) {
            sleep(0.5);
            NSLog(@"任务2----%@",[NSThread currentThread]);
        }
    });
    dispatch_barrier_sync(globalQueue, ^{
        for (NSInteger i = 0; i < 3; i++) {
            sleep(0.5);
            NSLog(@"barrieer任务----%@",[NSThread currentThread]);
        }
    });
    dispatch_async(globalQueue, ^{
        for (NSInteger i = 0; i < 3; i++) {
            sleep(0.5);
            NSLog(@"任务3----%@",[NSThread currentThread]);
        }
    });
    dispatch_async(globalQueue, ^{
        for (NSInteger i = 0; i < 3; i++) {
            sleep(0.5);
            NSLog(@"任务4----%@",[NSThread currentThread]);
        }
    });
    NSLog(@"结束%@",[NSThread currentThread]);
}


- (IBAction)communicationAction:(UIButton *)sender {
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
       
        for (NSInteger i = 0; i < 4; i++) {//work
            NSLog(@"异步任务%@",[NSThread currentThread]);
        }
        
        dispatch_async(dispatch_get_main_queue(), ^{
            //回到主线程 刷新UI
            NSLog(@"%@",[NSThread currentThread]);
        });
    });
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
