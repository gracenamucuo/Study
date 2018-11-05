//
//  ResidentThreadController.m
//  Runloop_Demo
//
//  Created by 戴运鹏 on 2018/5/24.
//  Copyright © 2018年 戴运鹏. All rights reserved.
//

#import "ResidentThreadController.h"
@interface ResidentThreadController ()
@property (nonatomic,strong)NSThread *residentThread;
@property (nonatomic,strong)NSRunLoop *runloop;
@property (nonatomic,strong)NSPort *port;
//@property (nonatomic,strong)NSTimer *timer;
@end

@implementation ResidentThreadController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.residentThread = [[NSThread alloc]initWithTarget:self selector:@selector(print) object:nil];
    [self.residentThread start];
}

- (void)print
{/*
  将子线程所在的runloop加入端口后，该线程就常驻。
  如果不s
  */
  

        NSLog(@"线程初次打印");
        NSLog(@"%@",[NSThread currentThread]);
    if (!self.port) {
        self.port = [NSPort port];
    }
    
        [[NSRunLoop currentRunLoop]addPort:self.port forMode:NSDefaultRunLoopMode];
    
//        self.timer =  [NSTimer scheduledTimerWithTimeInterval:2 target:self selector:@selector(timerAction) userInfo:nil repeats:YES];
//        [[NSRunLoop currentRunLoop]addTimer:self.timer forMode:NSDefaultRunLoopMode];
        self.runloop = [NSRunLoop currentRunLoop];
//    [[NSRunLoop currentRunLoop]runMode:NSDefaultRunLoopMode beforeDate:[NSDate distantFuture]];
    [[NSRunLoop currentRunLoop]runUntilDate:[NSDate distantFuture]];


}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [super touchesBegan:touches withEvent:event];
    [self performSelector:@selector(print) onThread:self.residentThread withObject:nil waitUntilDone:NO];

}

- (void)timerAction
{
    NSLog(@"定时器任务%@",[NSThread currentThread]);
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
//    [self.timer invalidate];
//    self.timer = nil;
    [self.runloop removePort:self.port forMode:NSRunLoopCommonModes];
    CFRunLoopStop(self.runloop.getCFRunLoop);
//    self.runloop = nil;
    [self.residentThread cancel];
     self.residentThread = nil;
}


- (void)dealloc
{

    self.residentThread = nil;
    NSLog(@"常驻线程销毁");
}

@end



