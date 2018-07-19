//
//  ViewController.m
//  Base_Demo
//
//  Created by 戴运鹏 on 2018/7/19.
//  Copyright © 2018年 戴运鹏. All rights reserved.
//

#import "ViewController.h"
#import "ETTableManager.h"
#import "UITableView+ETManager.h"
#import "ETBaseSectionViewModel.h"
#import "ETBaseCellViewModel.h"
#import "ETBaseTableViewCell.h"
#import "ETTableDelegate.h"
@interface ViewController ()
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UITableView *tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
    [self.view addSubview:tableView];
    ETBaseCellViewModel *vm1 = [[ETBaseCellViewModel alloc]init];
    vm1.title = @"第一行";
    vm1.icon = @"avatar";
    [vm1 configViewModelWithCellClassName:NSStringFromClass([ETBaseTableViewCell class]) initType:ETTableViewCellInitalType_xib tableView:tableView];
    
    ETBaseCellViewModel *vm2 = [[ETBaseCellViewModel alloc]init];
    vm2.title = @"第二行";
    vm2.icon = @"avatar";
    [vm2 configViewModelWithCellClassName:NSStringFromClass([ETBaseTableViewCell class]) initType:ETTableViewCellInitalType_xib tableView:tableView];
 
    
    
    ETBaseSectionViewModel *sectionVM = [[ETBaseSectionViewModel alloc]init];
    sectionVM.rows = @[vm1,vm2];
    
    ETTableDelegate *delegate = [[ETTableDelegate alloc]init];
    ETTableManager *manager = [[ETTableManager alloc]initWithSections:@[sectionVM] tableViewDelegate:delegate];
    delegate.manager = manager;
    tableView.manager = manager;
    [manager reloadData];
    
}



@end
