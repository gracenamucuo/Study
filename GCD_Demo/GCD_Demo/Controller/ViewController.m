//
//  ViewController.m
//  GCD_Demo
//
//  Created by 戴运鹏 on 2018/3/14.
//  Copyright © 2018年 戴运鹏. All rights reserved.
//

#import "ViewController.h"
#import "GCDTestHeaderView.h"
@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic,strong)NSMutableArray *dataSource;
@property (nonatomic,strong)NSMutableArray *sectionArry;
@end
static NSString *cellID = @"cellID";
static NSString *headerID = @"headerID";
@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
 
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:cellID];
    
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([GCDTestHeaderView class]) bundle:nil] forHeaderFooterViewReuseIdentifier:headerID];
    self.sectionArry = [NSMutableArray arrayWithArray:@[@"同步并发",@"同步串行",@"异步并发",@"异步串行",@"同步主队列",@"异步主队列"]];
    NSArray *section = @[@"主线程",@"子线程"];
    self.dataSource = [NSMutableArray array];
    for (NSInteger i = 0; i < 6; i++) {
        [self.dataSource addObject:section];
    }
    
    [self.tableView reloadData];
    
    //直接在主线程中执行 同步并发
//    [self test0];
    //子线程执行
//    [NSThread detachNewThreadSelector:@selector(test0) toTarget:self withObject:nil];
//
////    [self test1];
//    [NSThread detachNewThreadSelector:@selector(test1) toTarget:self withObject:nil];
//
//    [self test2];
//    [NSThread detachNewThreadSelector:@selector(test2) toTarget:self withObject:nil];
//
////    [self test3];
//    [NSThread detachNewThreadSelector:@selector(test3) toTarget:self withObject:nil];
//
////    [self test4];
//    [NSThread detachNewThreadSelector:@selector(test4) toTarget:self withObject:nil];
//
////    [self test5];
//    [NSThread detachNewThreadSelector:@selector(test5) toTarget:self withObject:nil];

}
#pragma mark -- methods

///同步函数 + 并发队列
- (void)test0
{
    NSLog(@"%@ 开始*******",[NSThread currentThread]);
    dispatch_sync(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        for (NSInteger i = 0; i<3; i++) {
            sleep(1);
            NSLog(@"1  --%@--",[NSThread currentThread]);
        }
    });
    
    dispatch_sync(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        for (NSInteger i = 0; i<3; i++) {
            sleep(1);
            NSLog(@"2  --%@--",[NSThread currentThread]);
        }
    });
    
    dispatch_sync(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        for (NSInteger i = 0; i<3; i++) {
            sleep(1);//线程休眠，模拟耗时操作
            NSLog(@"3  --%@--",[NSThread currentThread]);
        }
    });
    NSLog(@"%@ 结束*******",[NSThread currentThread]);
}

/// 同步 + 串行队列
- (void)test1{
    NSLog(@"%@ 开始*******",[NSThread currentThread]);
    dispatch_queue_t syncQueue = dispatch_queue_create("com.GCD.test1", DISPATCH_QUEUE_SERIAL);
    dispatch_sync(syncQueue, ^{
        for (NSInteger i = 0; i<5; i++) {
            sleep(0.5);
            NSLog(@"任务1  --%@--",[NSThread currentThread]);
        }
    });
    
    dispatch_sync(syncQueue, ^{
        for (NSInteger i = 0; i<5; i++) {
            sleep(0.5);
            NSLog(@"任务2  --%@--",[NSThread currentThread]);
        }
    });
    
    dispatch_sync(syncQueue, ^{
        for (NSInteger i = 0; i<5; i++) {
            sleep(0.5);
            NSLog(@"任务3  --%@--",[NSThread currentThread]);
        }
    });
    

    
    NSLog(@"%@ 结束*******",[NSThread currentThread]);
}

///异步 + 并发队列
- (void)test2
{
    NSLog(@"%@ 开始*******",[NSThread currentThread]);
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        for (NSInteger i = 0; i<5; i++) {
            sleep(0.5);
            NSLog(@"任务1  --%@--",[NSThread currentThread]);
        }
    });
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        for (NSInteger i = 0; i<5; i++) {
            sleep(0.5);
            NSLog(@"任务2  --%@--",[NSThread currentThread]);
        }
    });
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        for (NSInteger i = 0; i<5; i++) {
            sleep(0.5);
            NSLog(@"任务3  --%@--",[NSThread currentThread]);
        }
    });
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        for (NSInteger i = 0; i<5; i++) {
            sleep(0.5);
            NSLog(@"任务4  --%@--",[NSThread currentThread]);
        }
    });
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        for (NSInteger i = 0; i<5; i++) {
            sleep(0.5);
            NSLog(@"任务5  --%@--",[NSThread currentThread]);
        }
    });
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        for (NSInteger i = 0; i<5; i++) {
            sleep(0.5);
            NSLog(@"任务6  --%@--",[NSThread currentThread]);
        }
    });
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        for (NSInteger i = 0; i<5; i++) {
            sleep(0.5);
            NSLog(@"任务7  --%@--",[NSThread currentThread]);
        }
    });
    NSLog(@"%@ 结束*******",[NSThread currentThread]);
}

///异步 + 串行队列
- (void)test3
{
        dispatch_queue_t syncQueue = dispatch_queue_create("com.GCD.test1", DISPATCH_QUEUE_SERIAL);
    NSLog(@"%@ 开始*******",[NSThread currentThread]);
    dispatch_async(syncQueue, ^{
        for (NSInteger i = 0; i<3; i++) {
            sleep(0.5);
            NSLog(@"任务1  --%@--",[NSThread currentThread]);
        }
    });
    
    dispatch_async(syncQueue, ^{
        for (NSInteger i = 0; i<3; i++) {
            sleep(0.5);
            NSLog(@"任务2  --%@--",[NSThread currentThread]);
        }
    });
    
    dispatch_async(syncQueue, ^{
        for (NSInteger i = 0; i<3; i++) {
            sleep(0.5);
            NSLog(@"任务3  --%@--",[NSThread currentThread]);
        }
    });
    NSLog(@"%@ 结束*******",[NSThread currentThread]);
}

///同步 + 主队列
- (void)test4
{dispatch_queue_t mainQueue = dispatch_get_main_queue();
    NSLog(@"%@ 开始*******",[NSThread currentThread]);
    dispatch_sync(mainQueue, ^{
        for (NSInteger i = 0; i<3; i++) {
            sleep(0.5);
            NSLog(@"任务1  --%@--",[NSThread currentThread]);
        }
    });
    
    dispatch_sync(mainQueue, ^{
        for (NSInteger i = 0; i<3; i++) {
            sleep(0.5);
            NSLog(@"任务2  --%@--",[NSThread currentThread]);
        }
    });
    
    dispatch_sync(mainQueue, ^{
        for (NSInteger i = 0; i<3; i++) {
            sleep(0.5);
            NSLog(@"任务3  --%@--",[NSThread currentThread]);
        }
    });
    
    NSLog(@"%@ 结束*******",[NSThread currentThread]);
}

///异步 + 主队列
- (void)test5
{
    dispatch_queue_t mainQueue = dispatch_get_main_queue();
    NSLog(@"%@ 开始*******",[NSThread currentThread]);
    dispatch_async(mainQueue, ^{
        for (NSInteger i = 0; i<3; i++) {
            sleep(0.5);
            NSLog(@"任务1  --%@--",[NSThread currentThread]);
        }
    });
    
    dispatch_async(mainQueue, ^{
        for (NSInteger i = 0; i<3; i++) {
            sleep(0.5);
            NSLog(@"任务2  --%@--",[NSThread currentThread]);
        }
    });
    
    dispatch_async(mainQueue, ^{
        for (NSInteger i = 0; i<3; i++) {
            sleep(0.5);
            NSLog(@"任务3  --%@--",[NSThread currentThread]);
        }
    });
    NSLog(@"%@ 结束*******",[NSThread currentThread]);
}

#pragma mark - UITableViewDataSource && UITableViewDelegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.sectionArry.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSArray *sectionArray = self.dataSource[section];
    return sectionArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID forIndexPath:indexPath];
    NSArray *section = self.dataSource[indexPath.section];
    cell.textLabel.text = section[indexPath.row];
    return cell;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    GCDTestHeaderView *header = [tableView dequeueReusableHeaderFooterViewWithIdentifier:headerID];
    header.nameLabel.text = self.sectionArry[section];
    return header;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 50.f;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *selectorStr = [NSString stringWithFormat:@"test%ld",indexPath.section];
    
    if (indexPath.row == 0) {
        [self performSelectorOnMainThread:NSSelectorFromString(selectorStr) withObject:nil waitUntilDone:YES];
    }else if (indexPath.row == 1){
        [NSThread detachNewThreadSelector:NSSelectorFromString(selectorStr) toTarget:self withObject:nil];
    }
}

@end





































































