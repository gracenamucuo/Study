//
//  CellFactory.m
//  IM_Demo
//
//  Created by 戴运鹏 on 2018/9/11.
//  Copyright © 2018年 戴运鹏. All rights reserved.
//

#import "CellFactory.h"


@implementation CellFactory

- (UITableViewCell *)redCellInTable:(UITableView *)table
{
    NSString *identity = @"RedCell";
    UITableViewCell *cell = [table dequeueReusableCellWithIdentifier:identity];
    if (!cell) {
        NSString *cellCls = @"RedCell";
        [table registerNib:[UINib nibWithNibName:cellCls bundle:nil] forCellReuseIdentifier:identity];
         cell = [table dequeueReusableCellWithIdentifier:identity];
    }
    return cell;
}
- (UITableViewCell *)greenCellInTable:(UITableView *)table
{
    NSString *identity = @"GreenCell";
    UITableViewCell *cell = [table dequeueReusableCellWithIdentifier:identity];
    if (!cell) {
        NSString *cellCls = @"GreenCell";
        [table registerNib:[UINib nibWithNibName:cellCls bundle:nil] forCellReuseIdentifier:identity];
        cell = [table dequeueReusableCellWithIdentifier:identity];
    }
    return cell;
}
@end
