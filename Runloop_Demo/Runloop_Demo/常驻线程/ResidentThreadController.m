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
  将子线程所在的runloop加入端口后，该线程就常驻，没有退出。但是还是出现了没走dealloc的情况。
  */
    NSLog(@"线程初次打印");
    NSLog(@"%@",[NSThread currentThread]);
    self.port = [NSPort port];
    [[NSRunLoop currentRunLoop]addPort:self.port forMode:NSDefaultRunLoopMode];
    [[NSRunLoop currentRunLoop]runUntilDate:[NSDate dateWithTimeIntervalSinceNow:5]];
//    [[NSRunLoop currentRunLoop]run];
    self.runloop = [NSRunLoop currentRunLoop];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [super touchesBegan:touches withEvent:event];
    [self performSelector:@selector(print) onThread:self.residentThread withObject:nil waitUntilDone:NO];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
//
//    [self.runloop removePort:self.port forMode:NSDefaultRunLoopMode];
//    [self.residentThread cancel];
//    self.residentThread = nil;
//    self.runloop = nil;
}

- (void)dealloc
{
    NSLog(@"常驻线程销毁");
}

@end



