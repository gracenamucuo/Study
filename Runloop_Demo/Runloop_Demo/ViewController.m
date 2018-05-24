//
//  ViewController.m
//  Runloop_Demo
//
//  Created by 戴运鹏 on 2018/5/24.
//  Copyright © 2018年 戴运鹏. All rights reserved.
//

#import "ViewController.h"
#import "UIViewController+loadFromStoryBoard.h"
@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic,strong)NSMutableArray *dataArray;
@end
static NSString *cellID = @"cellID";
@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:cellID];
    self.tableView.rowHeight = 50.f;
    self.dataArray = [NSMutableArray array];
    [self.dataArray addObjectsFromArray:@[@"ObserverController",@"ResidentThreadController"]];
    self.tableView.tableFooterView = [UIView new];
    [self.tableView reloadData];
}

#pragma mark -- UITableViewDelegate,UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID forIndexPath:indexPath];
    cell.textLabel.text = self.dataArray[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    Class cls = NSClassFromString(self.dataArray[indexPath.row]);
    UIViewController *vc = [cls loadFromStoryBoard];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
//    NSLog(@"%@",[NSRunLoop currentRunLoop]);
}

@end
