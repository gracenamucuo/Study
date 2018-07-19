//
//  ETTableManager.m
//  Base_Demo
//
//  Created by 戴运鹏 on 2018/7/19.
//  Copyright © 2018年 戴运鹏. All rights reserved.
//

#import "ETTableManager.h"
#import "ETTableDelegate.h"
@implementation ETTableManager
#pragma mark -- init
- (instancetype)initWithSections:(NSArray *)sections tableViewDelegate:(ETTableDelegate *)delegate
{
    if (self = [super init]) {
        _sections = sections;
        _delegate = delegate;
        _delegate.manager = self;
    }
    return self;
}

#pragma mark -- 绑定
- (void)bindToTableView:(UITableView *)tableView
{
    self.tableView = tableView;
    tableView.dataSource = self.delegate;
    tableView.delegate = self.delegate;
    
}
#pragma mark -- 获得viewModel
- (id<ETRowConvertableProtocol>)rowAtIndexPath:(NSIndexPath *)indexPath
{
    id<ETSectionConvertableProtocol> sectionModel = self.sections[indexPath.section];
    return sectionModel.rows[indexPath.row];
}

- (void)reloadData
{
    [self.tableView reloadData];
}
@end
