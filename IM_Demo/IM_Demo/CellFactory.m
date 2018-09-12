//
//  CellFactory.m
//  IM_Demo
//
//  Created by 戴运鹏 on 2018/9/11.
//  Copyright © 2018年 戴运鹏. All rights reserved.
//

#import "CellFactory.h"
#import "GreenCell.h"
#import "RedCell.h"

@implementation CellFactory

- (UITableViewCell *)redCellInTable:(UITableView *)table model:(NSString *)model
{
    NSString *identity = @"RedCell";
    RedCell *cell = (RedCell*)[table dequeueReusableCellWithIdentifier:identity];
    if (!cell) {
        NSString *cellCls = @"RedCell";
        [table registerNib:[UINib nibWithNibName:cellCls bundle:nil] forCellReuseIdentifier:identity];
         cell = (RedCell*)[table dequeueReusableCellWithIdentifier:identity];
    }
    [cell refreshData:model];
    return cell;
}
- (UITableViewCell *)greenCellInTable:(UITableView *)table model:(NSString *)model
{
    NSString *identity = @"GreenCell";
    GreenCell *cell = (GreenCell*)[table dequeueReusableCellWithIdentifier:identity];
    if (!cell) {
        NSString *cellCls = @"GreenCell";
        [table registerNib:[UINib nibWithNibName:cellCls bundle:nil] forCellReuseIdentifier:identity];
        cell = (GreenCell*)[table dequeueReusableCellWithIdentifier:identity];
    }
    [cell refreshData:model];
    return cell;
}
@end
