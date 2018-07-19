//
//  ETTableDelegate.m
//  Base_Demo
//
//  Created by 戴运鹏 on 2018/7/19.
//  Copyright © 2018年 戴运鹏. All rights reserved.
//

#import "ETTableDelegate.h"
#import "ETTableManager.h"
@implementation ETTableDelegate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.manager.sections.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.manager.sections[section].rows.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    id<ETSectionConvertableProtocol> section = self.manager.sections[indexPath.section];
    id<ETRowConvertableProtocol> row = section.rows[indexPath.row];
    return row.cellForRowAt(tableView,indexPath);
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    id<ETSectionConvertableProtocol> section = self.manager.sections[indexPath.section];
    id<ETRowConvertableProtocol> row = section.rows[indexPath.row];
    return row.rowHeight;
}

- (UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
        id<ETSectionConvertableProtocol> sectionModel = self.manager.sections[section];
    return sectionModel.viewForHeader(tableView,section);
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
      id<ETSectionConvertableProtocol> sectionModel = self.manager.sections[section];
    return sectionModel.heightForHeader;
}
@end
