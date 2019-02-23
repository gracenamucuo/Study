//
//  ViewController.m
//  内存
//
//  Created by 戴运鹏 on 2019/2/12.
//  Copyright © 2019 戴运鹏. All rights reserved.
//

#import "ViewController.h"
#import "Model.h"
#import <objc/runtime.h>
@interface ViewController ()
@property (nonatomic,assign)CFRunLoopObserverRef obsever;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [super touchesBegan:touches withEvent:event];
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSLog(@"1");
//        NSTimer *timer = [NSTimer timerWithTimeInterval:1 repeats:NO block:^(NSTimer * _Nonnull timer) {
//            NSLog(@"timer源");
//        }];
//        [self addObserver];
        NSRunLoop *runloop = [NSRunLoop currentRunLoop];
//        [runloop addTimer:timer forMode:NSDefaultRunLoopMode];
//        [self performSelector:@selector(testPerform) withObject:nil afterDelay:0];//
        
        [runloop run];
        NSLog(@"3");
    });
}

- (void)testPerform{
    NSLog(@"2");
}



- (void)addObserver
{
    /*
     kCFRunLoopEntry = (1UL << 0),1
     kCFRunLoopBeforeTimers = (1UL << 1),2
     kCFRunLoopBeforeSources = (1UL << 2), 4
     kCFRunLoopBeforeWaiting = (1UL << 5), 32
     kCFRunLoopAfterWaiting = (1UL << 6), 64
     kCFRunLoopExit = (1UL << 7),128
     kCFRunLoopAllActivities = 0x0FFFFFFFU
     */
    
    CFRunLoopObserverRef observer = CFRunLoopObserverCreateWithHandler(CFAllocatorGetDefault(), kCFRunLoopAllActivities, YES, 0, ^(CFRunLoopObserverRef observer, CFRunLoopActivity activity) {
        switch (activity) {
            case 1:
            {
                NSLog(@"进入runloop");
            }
                break;
            case 2:
            {
                NSLog(@"timers");
            }
                break;
            case 4:
            {
                NSLog(@"sources");
            }
                break;
            case 32:
            {
                NSLog(@"即将进入休眠");
            }
                break;
            case 64:
            {
                NSLog(@"唤醒");
            }
                break;
            case 128:
            {
                NSLog(@"退出");
            }
                break;
                
            default:
                break;
        }
    });
    CFRunLoopAddObserver(CFRunLoopGetCurrent(), observer, kCFRunLoopCommonModes);//将观察者添加到common模式下，这样当default模式和UITrackingRunLoopMode两种模式下都有回调。
    self.obsever  = observer;
    CFRelease(observer);
}

- (void)testMethod
{
    Model *m = [[Model alloc]init];
    if ([m respondsToSelector:@selector(testInstanceMethod)]) {
        NSLog(@"对象方法");
    }
    if ([Model instancesRespondToSelector:@selector(testInstanceMethod)]) {
        [Model testClassMethod];
        NSLog(@"类方法");
    }
}

- (void)testInstance
{
    Model *m = [[Model alloc]init];
    Class cls0 = object_getClass(m);//这个方法相当于调用的isa
    Class cls1 = [m class];
    Class cls2 = [Model class];
    NSLog(@"%p %p %p %p",cls0,cls1,cls2,object_getClass(cls2));
    NSLog(@"%d %d %d  %d",class_isMetaClass(cls0),class_isMetaClass(cls1),class_isMetaClass(cls2),class_isMetaClass(object_getClass(cls2)));
    
}

- (void)testAutoReleasepool1{
    for (int i = 0; i < UINTMAX_MAX; i++) {
//        @autoreleasepool {
        NSString *str = [NSString stringWithFormat:@"%d",i];
            Model *m = [Model new];
            m.age = i;
//        }
        
        
    }
    NSLog(@"结束1");
}

- (void)testAutoReleasepool2{
    for (int i = 0; i < 10e5 * 2; i++) {
        NSString *str = [NSString stringWithFormat:@"%d",i];
        Model *m = [Model new];
        m.age = i;
    }
    NSLog(@"结束2");
}


@end
