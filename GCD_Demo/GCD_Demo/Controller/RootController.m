//
//  RootController.m
//  GCD_Demo
//
//  Created by 戴运鹏 on 2018/3/15.
//  Copyright © 2018年 戴运鹏. All rights reserved.
//

#import "RootController.h"
#import "ViewController.h"
#import "QueueGroupController.h"
#import "OtherController.h"
@interface RootController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic,strong)NSMutableArray *dataSource;
@end
static NSString *cellID = @"cellID";
@implementation RootController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:cellID];
    self.tableView.rowHeight = 45.f;
    self.dataSource = [NSMutableArray arrayWithArray:@[@"同步异步+队列",@"队列组",@"其他"]];
}

#pragma mark --UITableViewDelegate && UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID forIndexPath:indexPath];
    if (self.dataSource.count > indexPath.row) {
        cell.textLabel.text = self.dataSource[indexPath.row];
        return cell;
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        ViewController *vc = (ViewController*)[[UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]] instantiateViewControllerWithIdentifier:NSStringFromClass([ViewController class])];
        [self.navigationController pushViewController:vc animated:YES];
    }else if (indexPath.row == 1){
        QueueGroupController *groupVC = (QueueGroupController *)[[UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]] instantiateViewControllerWithIdentifier:NSStringFromClass([QueueGroupController class])];
        [self.navigationController pushViewController:groupVC animated:YES];
    }else if (indexPath.row == 2){
        OtherController *other = (OtherController *)[[UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]] instantiateViewControllerWithIdentifier:NSStringFromClass([OtherController class])];
        [self.navigationController pushViewController:other animated:YES];
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
