//
//  ViewController.m
//  Runloop_Demo
//
//  Created by 戴运鹏 on 2019/2/18.
//  Copyright © 2019 戴运鹏. All rights reserved.
//


#import "ViewController.h"
#import "RunloopCustomCell.h"

typedef void(^RenderBlock)();

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic,assign)CFRunLoopObserverRef obsever;
@property (nonatomic,strong)NSMutableArray *taskQueue;
@end
static NSString *cellID = @"cellID";
@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.rowHeight = 140;
    [self addObserver];
    self.taskQueue = [NSMutableArray array];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 30;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    RunloopCustomCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellID" forIndexPath:indexPath];
    
    
    RenderBlock blk = ^(){
        [cell renderUIWithIndex:indexPath.row completion:^{
            
        }];
    };
    [self.taskQueue addObject:blk];
    return cell;
    
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
                NSLog(@"进入");
            }
                break;
            case 2:
            {
                NSLog(@"timeers");
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
                [self doTasks];
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

- (void)doTasks
{
    [self.taskQueue enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        RenderBlock blk = obj;
        blk();
        [self.taskQueue removeObject:obj];
    }];
}

@end
