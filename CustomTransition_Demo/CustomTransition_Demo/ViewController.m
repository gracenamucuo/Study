//
//  ViewController.m
//  CustomTransition_Demo
//
//  Created by 戴运鹏 on 2018/4/5.
//  Copyright © 2018年 戴运鹏. All rights reserved.
//

#import "ViewController.h"
#import "NoneInteractionFromVC.h"
#import "UIViewController+LoadController.h"
#import "Constant.h"
#import "NavgationTransitionFromController.h"
#import "NavgationTransitionToController.h"
#import "TabTransitionFirstController.h"
#import "TabTransitionSecondController.h"
#import "TabTransitionThirdController.h"
#import "TabTransitionRootController.h"
#import "PresentingController.h"
@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic,strong)NSMutableArray *dataSource;
@end
static NSString *cellID = @"cellID";
@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:cellID];
}

#pragma mark -- UITableViewDataSource && UITableViewDelegate
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
    [tableView deselectRowAtIndexPath:indexPath animated:YES];

    NSString *classStr = self.dataSource[indexPath.row];
    if (indexPath.row == 0) {
        PresentingController *presentingVC = [PresentingController loadFromMainStoryboard];
//        [self.navigationController pushViewController:presentingVC animated:YES];
        [self presentViewController:presentingVC animated:YES completion:nil];
    }else if (indexPath.row == 2) {
        Class cls = NSClassFromString(classStr);
        UIViewController *vc = [cls performSelector:@selector(loadFromMainStoryboard)];
        [self.navigationController pushViewController:vc animated:YES];
    }else{
        UITabBarController *tab = [[UITabBarController alloc]init];
        TabTransitionFirstController *first = [TabTransitionFirstController loadFromMainStoryboard];
        TabTransitionSecondController *second = [TabTransitionSecondController loadFromMainStoryboard];
        TabTransitionThirdController *third = [TabTransitionThirdController loadFromMainStoryboard];
        [tab setViewControllers:@[first,second,third]];
        for (NSInteger i = 0; i < tab.tabBar.items.count; i++) {
            UITabBarItem *item = tab.tabBar.items[i];
            item.title = [NSString stringWithFormat:@"第%ld",(long)i];
        }
        [self.navigationController pushViewController:tab animated:YES];
    }

}

#pragma mark -- LAZY
- (NSMutableArray *)dataSource
{
    if (!_dataSource) {
        _dataSource = [NSMutableArray array];
        
        [_dataSource addObjectsFromArray:@[@"模态转场",@"Tab",@"ModelTransitionFromController"]];
    }
    return _dataSource;
}
@end





















