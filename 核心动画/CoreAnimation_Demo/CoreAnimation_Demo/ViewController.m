//
//  ViewController.m
//  CoreAnimation_Demo
//
//  Created by 戴运鹏 on 2018/4/18.
//  Copyright © 2018年 戴运鹏. All rights reserved.
//

#import "ViewController.h"
#import <CoreText/CoreText.h>
#import "LayerLabel.h"
#import "UIViewController+loadFromStoryBoard.h"
@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic,strong)NSMutableArray *dataArray;

@end
static NSString *cellID = @"cellID";
@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.dataArray = [NSMutableArray arrayWithArray:@[@"CustomActionsController",@"ExplicitAnimationController",@"CATransitionController",@"RemoveAnimationController",@"CAMediaTimingController",@"ManualOperationController",@"BufferController"]];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:cellID];
    self.tableView.rowHeight = 45.f;
    self.tableView.tableFooterView = [UIView new];
}

#pragma mark -- TableViewDataSource && TableViewDelegate
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
    NSString *vcName = self.dataArray[indexPath.row];
    Class cls = NSClassFromString(vcName);
    UIViewController *vc = [cls loadFromStoryBoard];
    [self.navigationController pushViewController:vc animated:YES];
    
}

@end

















































