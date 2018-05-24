//
//  ObserverController.m
//  Runloop_Demo
//
//  Created by 戴运鹏 on 2018/5/24.
//  Copyright © 2018年 戴运鹏. All rights reserved.
//

#import "ObserverController.h"

@interface ObserverController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong)NSTimer *timer;
@property (nonatomic,assign)CFRunLoopObserverRef obsever;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@end
static NSString *cellID = @"cellID";
@implementation ObserverController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:cellID];
    self.tableView.tableFooterView = [UIView new];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    self.tableView.rowHeight = self.view.bounds.size.height - 64;
    
    //======================================================================
    [self addObserver];
  NSTimer *timer = [NSTimer timerWithTimeInterval:2 target:self selector:@selector(print) userInfo:nil repeats:YES];
    [[NSRunLoop currentRunLoop]addTimer:timer forMode:NSDefaultRunLoopMode];
//    [[NSRunLoop currentRunLoop]addTimer:timer forMode:UITrackingRunLoopMode];
    
   /*
    也可以通过这种方法将timer添加到对应的mode中。
   timer performSelector:<#(nonnull SEL)#> withObject:<#(nullable id)#> afterDelay:<#(NSTimeInterval)#> inModes:<#(nonnull NSArray<NSRunLoopMode> *)#>
   */
    NSLog(@"%@",timer);
    self.timer = timer;
    
}

- (void)print
{
    NSLog(@"定时器任务");
    NSLog(@"定时器任务-------当前runloop%p----mode为%@",[NSRunLoop currentRunLoop],[[NSRunLoop currentRunLoop]currentMode]);//加在什么模式下，才会在某个模式下执行。
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
//        NSLog(@"---监听到Runloop状态发生改变--%lu",activity);
        if (activity == 128) {
            NSLog(@"退出");
                NSLog(@"当前runloop----mode为%@",[[NSRunLoop currentRunLoop]currentMode]);
        }
//        NSLog(@"当前runloop%p----mode为%@",[NSRunLoop currentRunLoop],[[NSRunLoop currentRunLoop]currentMode]);
    });
    CFRunLoopAddObserver(CFRunLoopGetCurrent(), observer, kCFRunLoopCommonModes);//将观察者添加到common模式下，这样当default模式和UITrackingRunLoopMode两种模式下都有回调。
    self.obsever  = observer;

    CFRelease(observer);
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.timer invalidate];
    self.timer = nil;
}

#pragma mark -- UItableViewDataSource && UItableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 30;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID forIndexPath:indexPath];
    cell.textLabel.text = @"你好";
    return cell;
}

- (void)dealloc//【需要找到合适的时机将timer废弃并且职位nil】
{/*
  有个问题，当有timer的时候(不加到runloop中也是一样)，即便在dealloc中将timer不可用并且=nil后【将这两句代码写在timer的定时执行方法中，就可以走dealloc】，还是不走dealloc方法，但是用instruments检测也没有内存泄漏。
  */
    NSLog(@"销毁");
}

@end
