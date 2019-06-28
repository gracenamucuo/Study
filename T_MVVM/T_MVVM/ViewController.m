//
//  ViewController.m
//  T_MVVM
//
//  Created by dyp on 2019/6/17.
//  Copyright © 2019 dyp. All rights reserved.
//

#import "ViewController.h"
#import "GreetingController.h"
#import "LoginController.h"
#import "ProductListController.h"
#import "InputController.h"
@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic,strong)NSArray *dataSource;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configTableView];
}

- (void)configTableView
{
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cellID"];
    self.dataSource = @[@"GreetingController",@"LoginController",@"ProductListController",@"InputController"];
    [self.tableView reloadData];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellID" forIndexPath:indexPath];
    cell.textLabel.text = self.dataSource[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    Class cls = NSClassFromString(self.dataSource[indexPath.row]);
    UIViewController *vc = [[cls alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
    
}


@end
