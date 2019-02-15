//
//  ViewController.m
//  Crash
//
//  Created by 戴运鹏 on 2019/2/15.
//  Copyright © 2019 戴运鹏. All rights reserved.
//

#import "ViewController.h"
#import "TestKVOCrash.h"
@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic,copy)NSString *test;
@property (nonatomic,strong)NSArray *data;
@property (nonatomic,strong)TestKVOCrash *t;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.data = [NSArray arrayWithObjects:@"数组加入nil",@"数组越界",@"执行不存在的方法",@"KVO的被观察者dealloc时仍然注册着KVO",@"重复remove Observe", nil];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cellID"];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.data.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellID" forIndexPath:indexPath];
    cell.textLabel.text = self.data[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    switch (indexPath.row) {
        case 0:
        {
            NSMutableArray *mutable= [NSMutableArray array];
            [mutable addObject:nil];
        }
            break;
        case 1:
        {
             NSString *beyondBound = [self.data objectAtIndex:1000];
            NSString *subIndex = self.data[10000];
//            NSMutableArray *mutable = [[NSMutableArray array]init];
//            NSString *t = mutable[100];
            NSInteger i = [self.data indexOfObject:@"2"];
            NSNotFound;
            NSLog(@"%ld",(long)i);
        }
            break;
        case 2:
        {
            UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
            [btn performSelector:@selector(doUnimplementationMethod)];
        }
            break;
        case 3:
        {
            [self KVOtest1];
        }
            break;
        case 4:
        {
            [self KVOtest2];
        }
            break;
        default:
            break;
    }
    
}
- (void)KVOtest1
{
    TestKVOCrash *t = [[TestKVOCrash alloc]init];
    [t addObserver:self forKeyPath:@"name" options:NSKeyValueObservingOptionNew context:nil];
}

- (void)KVOtest2
{
    TestKVOCrash *t = [[TestKVOCrash alloc]init];
    [t addObserver:self forKeyPath:@"name" options:NSKeyValueObservingOptionNew context:nil];
    [t removeObserver:self forKeyPath:@"name"];
    [t removeObserver:self forKeyPath:@"name"];
}


@end
