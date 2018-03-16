//
//  QueueGroupController.m
//  GCD_Demo
//
//  Created by 戴运鹏 on 2018/3/15.
//  Copyright © 2018年 戴运鹏. All rights reserved.
//

#import "QueueGroupController.h"

@interface QueueGroupController ()

@end

@implementation QueueGroupController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)notifyAction:(UIButton *)sender {
    NSLog(@"当前线程开始：%@",[NSThread currentThread]);
    dispatch_group_t  group = dispatch_group_create();
    
    dispatch_group_async(group, dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        for (NSInteger i = 0; i < 3; i++) {
            sleep(0.5);
            NSLog(@"任务1-----%@",[NSThread currentThread]);
        }
    });
    
    dispatch_group_async(group, dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        for (NSInteger i = 0; i < 3; i++) {
            sleep(0.5);
            NSLog(@"任务2-----%@",[NSThread currentThread]);
        }
    });
    
    dispatch_group_notify(group, dispatch_get_main_queue(), ^{
       //通知回到主线程执行任务
        for (NSInteger i = 0; i < 3; i++) {
            NSLog(@"通知后的任务:%@",[NSThread currentThread]);
        }
    });
    NSLog(@"当前线程结束：%@",[NSThread currentThread]);
    
}


- (IBAction)enterLeaveAction:(UIButton *)sender {
    NSLog(@"当前线程开始：%@",[NSThread currentThread]);
    dispatch_group_t group = dispatch_group_create();
    dispatch_queue_t globalQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_group_enter(group);
    dispatch_async(globalQueue, ^{
        for (NSInteger i = 0; i < 3; i++) {
            sleep(0.5);
            NSLog(@"任务1-----%@",[NSThread currentThread]);
        }
        dispatch_group_leave(group);
    });
    
    
    dispatch_group_enter(group);
    
    dispatch_async(globalQueue, ^{
        for (NSInteger i = 0; i < 3; i++) {
            sleep(0.5);
            NSLog(@"任务2-----%@",[NSThread currentThread]);
        }
        dispatch_group_leave(group);
    });
    
    dispatch_group_notify(group, dispatch_get_main_queue(), ^{
         NSLog(@"通知后的任务:%@",[NSThread currentThread]);
    });
    NSLog(@"当前线程结束：%@",[NSThread currentThread]);
}

- (IBAction)waitAction:(UIButton *)sender {
    NSLog(@"当前线程开始：%@",[NSThread currentThread]);
    
    dispatch_group_t  group = dispatch_group_create();
    
    dispatch_group_async(group, dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        for (NSInteger i = 0; i < 3; i++) {
            sleep(0.5);
            NSLog(@"任务1-----%@",[NSThread currentThread]);
        }
    });
    
    dispatch_group_async(group, dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        for (NSInteger i = 0; i < 3; i++) {
            sleep(0.5);
            NSLog(@"任务2-----%@",[NSThread currentThread]);
        }
    });
    
    dispatch_group_wait(group, DISPATCH_TIME_FOREVER);
    
    NSLog(@"等待结束后的执行%@",[NSThread currentThread]);
    
    NSLog(@"当前线程结束：%@",[NSThread currentThread]);
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
