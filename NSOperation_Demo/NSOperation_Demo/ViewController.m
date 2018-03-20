//
//  ViewController.m
//  NSOperation_Demo
//
//  Created by 戴运鹏 on 2018/3/19.
//  Copyright © 2018年 戴运鹏. All rights reserved.
//

#import "ViewController.h"
#import "NSInvocationOperationController.h"
#import "NSBlockOperationController.h"
#import "CustomOperationController.h"
#import "QueueBlockController.h"
@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic,strong)NSMutableArray *dataSource;
@end
static NSString *cellID = @"cellID";
@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:cellID];
    self.tableView.rowHeight = 45.f;
    self.dataSource = [NSMutableArray arrayWithArray:@[@"NSInvocationOperation",@"NSBlockOperation",@"CustomOperation",@"队列Block"]];
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID forIndexPath:indexPath];
    cell.textLabel.text = self.dataSource[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
    if (indexPath.row == 0) {
        NSInvocationOperationController *invocationVC = (NSInvocationOperationController*)[sb instantiateViewControllerWithIdentifier:NSStringFromClass([NSInvocationOperationController class])];
        [self.navigationController pushViewController:invocationVC animated:YES];
    }else if (indexPath.row == 1){
        NSBlockOperationController *blockVC = (NSBlockOperationController *)[sb instantiateViewControllerWithIdentifier:NSStringFromClass([NSBlockOperationController class])];
        [self.navigationController pushViewController:blockVC animated:YES];
    }else if (indexPath.row == 2){
        CustomOperationController *customVC  = (CustomOperationController *)[sb instantiateViewControllerWithIdentifier:NSStringFromClass([CustomOperationController class])];
        [self.navigationController pushViewController:customVC animated:YES];
    }else if (indexPath.row == 3){
        QueueBlockController *blockVC = (QueueBlockController *)[[UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]] instantiateViewControllerWithIdentifier:NSStringFromClass([QueueBlockController class])];
        [self.navigationController pushViewController:blockVC animated:YES];
    }
}



@end


















