//
//  ViewController.m
//  Design_Demo
//
//  Created by 戴运鹏 on 2018/5/11.
//  Copyright © 2018年 戴运鹏. All rights reserved.
//

#import "ViewController.h"
#import "UIViewController+loadFromStoryBoard.h"
@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic,strong)NSMutableArray *dataSource;
@end
static NSString *cellID = @"cellID";
@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:cellID];
    self.tableView.tableFooterView = [UIView new];
    self.dataSource = [NSMutableArray arrayWithArray:@[@"SimpleFactoryPatternController",@"FactoryMethodController",@"AbstractFactoryController"]];
    self.tableView.rowHeight = 50.f;
    
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
    NSString *clsName = self.dataSource[indexPath.row];
    Class cls = NSClassFromString(clsName);
   UIViewController *vc = [cls loadFromStoryBoard];
    [self.navigationController pushViewController:vc animated:YES];
}

@end
