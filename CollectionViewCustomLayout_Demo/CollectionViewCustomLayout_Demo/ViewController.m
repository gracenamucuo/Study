//
//  ViewController.m
//  CollectionViewCustomLayout_Demo
//
//  Created by 戴运鹏 on 2018/5/6.
//  Copyright © 2018年 戴运鹏. All rights reserved.
//

#import "ViewController.h"
#import "UIViewController+loadFromStoryBoard.h"
@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic,strong)NSMutableArray *dataSource;
@end
static NSString *cellID = @"cellID";
@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:cellID];
    self.tableView.rowHeight = 60.f;
    self.dataSource = [NSMutableArray array];
    [self.dataSource addObjectsFromArray:@[@"CollectionViewController"]];
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
    NSString *clsStr = self.dataSource[indexPath.row];
    Class cls = NSClassFromString(clsStr);
    UIViewController *vc = [cls loadFromStoryBoard];
    [self.navigationController pushViewController:vc animated:YES];
    
}

@end






