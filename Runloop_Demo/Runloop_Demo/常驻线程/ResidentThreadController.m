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
@property (nonatomic,strong)NSTimer *timer;
@end

@implementation ResidentThreadController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.residentThread = [[NSThread alloc]initWithTarget:self selector:@selector(print) object:nil];
    [self.residentThread start];
//    NSLog(@"%@",[NSRunLoop currentRunLoop]);
}

- (void)print
{/*
  将子线程所在的runloop加入端口后，该线程就常驻。
  如果不s
  */
    NSLog(@"线程初次打印");
    NSLog(@"%@",[NSThread currentThread]);
    self.port = [NSPort port];
    [[NSRunLoop currentRunLoop]addPort:self.port forMode:NSDefaultRunLoopMode];
    [[NSRunLoop currentRunLoop]runUntilDate:[NSDate dateWithTimeIntervalSinceNow:0]];

    NSTimer *timer = [NSTimer timerWithTimeInterval:5 repeats:YES block:^(NSTimer * _Nonnull timer) {
        NSLog(@"添加到runloop内的定时器");
    }];
    self.timer = timer;
    self.runloop = [NSRunLoop currentRunLoop];
    [[NSRunLoop currentRunLoop]addTimer:timer forMode:NSDefaultRunLoopMode];
//    [[NSRunLoop currentRunLoop]run];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [super touchesBegan:touches withEvent:event];
    [self performSelector:@selector(print) onThread:self.residentThread withObject:nil waitUntilDone:NO];
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    [self.timer invalidate];
    self.timer = nil;
    self.runloop = nil;
    self.residentThread = nil;
    
}

- (void)dealloc
{
    self.residentThread = nil;
    [self.timer invalidate];
    self.timer = nil;
    NSLog(@"常驻线程销毁");
}

@end



