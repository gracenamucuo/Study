//
//  Sec.m
//  TestDB
//
//  Created by 戴运鹏 on 2018/10/10.
//  Copyright © 2018年 戴运鹏. All rights reserved.
//

#import "Sec.h"

@interface Sec ()
@property (nonatomic,strong)dispatch_source_t timer;
@property (nonatomic,assign)NSInteger count;
@property (nonatomic,strong)NSTimer *nstimer;
@property (nonatomic,strong)CADisplayLink *displayLink;
@end

@implementation Sec

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor greenColor];
    self.count = 100;
//    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
//    [self testGCDTimer];
//         [self testNSTimer];
//    });

    [self testCADisplayLink];
//    [self addNoti];
//    [self testNSTimer];
}

- (void)testCADisplayLink
{
    self.displayLink = [CADisplayLink displayLinkWithTarget:self selector:@selector(displayLinkAction)];
//    self.displayLink.frameInterval = 60;
    self.displayLink.preferredFramesPerSecond = 2;
    [self.displayLink addToRunLoop:[NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
}

- (void)displayLinkAction
{
    NSLog(@"displayLink Action");
}

- (void)testNSTimer
{
//    self.nstimer = [NSTimer timerWithTimeInterval:2 target:self selector:@selector(nstimerAction) userInfo:nil repeats:YES];
//    __weak typeof(self) weakSelf = self;
//    self.nstimer = [NSTimer timerWithTimeInterval:2 repeats:YES block:^(NSTimer * _Nonnull timer) {
//        [weakSelf nstimerAction];
//    }];
//    [[NSRunLoop currentRunLoop]addTimer:self.nstimer forMode:NSRunLoopCommonModes];
    
//    self.nstimer = [NSTimer scheduledTimerWithTimeInterval:1 repeats:YES block:^(NSTimer * _Nonnull timer) {
//        [self nstimerAction];
//    }];
}

- (void)nstimerAction
{
    NSLog(@"%@",[NSThread currentThread]);
    NSLog(@"0---0");
NSLog(@"定时器信息");
}

- (void)testGCDTimer
{
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_source_t timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, queue);
    dispatch_source_set_timer(timer, DISPATCH_TIME_NOW, 2 * NSEC_PER_SEC, 0);
    dispatch_source_set_event_handler(timer, ^{
        self.count -= 1;
        if (self.count<0) {
            dispatch_source_cancel(self.timer);
        }else{
            NSLog(@"%@",[NSThread currentThread]);
//            dispatch_async(dispatch_get_main_queue(), ^{
                NSLog(@"定时器信息");
//            });
        }
        
    });
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        dispatch_resume(timer);
    });
    
    self.timer = timer;
}

//- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
//{
//    [super touchesBegan:touches withEvent:event];
////    dispatch_source_cancel(self.timer);
//    [self testNoti];
//}

- (void)addNoti
{
//    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
         [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(notiAction) name:@"123" object:nil];
//    });
   
}

- (void)testNoti
{
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSLog(@"%@",[NSThread currentThread]);
    [[NSNotificationCenter defaultCenter]postNotificationName:@"123" object:nil];
        });
}

- (void)notiAction
{
    NSLog(@"接收到了通知%@",[NSThread currentThread]);
    
}

- (void)dealloc
{
    NSLog(@"销毁了");

//    [self.displayLink removeFromRunLoop:[NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
//    [self.displayLink invalidate];
//    self.displayLink = nil;
    [self.nstimer invalidate];
    self.nstimer = nil;
//    self.timer = nil;
    [[NSNotificationCenter defaultCenter]removeObserver:self];
  
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [super touchesBegan:touches withEvent:event];
    [self.displayLink removeFromRunLoop:[NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
    [self.displayLink invalidate];
    self.displayLink = nil;
}

@end
