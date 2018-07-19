//
//  BaseRow.m
//  Base_Demo
//
//  Created by 戴运鹏 on 2018/7/19.
//  Copyright © 2018年 戴运鹏. All rights reserved.
//

#import "ETBaseCellViewModel.h"
#import "UITableViewCell+ETRenderUI.h"
@implementation ETBaseCellViewModel
@synthesize cellForRowAt;
@synthesize reuseIdentifier;
@synthesize rowHeight;
@synthesize initType;
@synthesize cellClassName;
@synthesize registerBlock;
- (RowCellBlock)cellForRowAt
{
    return ^(UITableView *tableView,NSIndexPath *indexPath){
//        if ([tableView dequeueReusableCellWithIdentifier:self.reuseIdentifier forIndexPath:indexPath]) {
//        return [tableView dequeueReusableCellWithIdentifier:self.reuseIdentifier forIndexPath:indexPath];
//        }
//        switch (self.initType) {
//            case ETTableViewCellInitalType_Code:
//                [tableView registerClass:NSClassFromString(self.cellClassName) forCellReuseIdentifier:self.reuseIdentifier];
//                break;
//            case ETTableViewCellInitalType_xib:
//                [tableView registerNib:[UINib nibWithNibName:self.cellClassName bundle:nil] forCellReuseIdentifier:self.reuseIdentifier];
//                break;
//        }
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:self.reuseIdentifier forIndexPath:indexPath];
        [cell renderUIWithModel:self];
        return cell;
    };
}
//- (NSString *)reuseIdentifier
//{
//    return NSStringFromClass([self class]);
//}

- (RegisterBlock)registerBlock
{
    return ^(UITableView *tableView,Class cellClass,ETTableViewCellInitalType initialType){
        switch (initialType) {
            case ETTableViewCellInitalType_xib:
                [tableView registerNib:[UINib nibWithNibName:NSStringFromClass(cellClass) bundle:nil] forCellReuseIdentifier:NSStringFromClass(cellClass)];
                break;
            case ETTableViewCellInitalType_Code:
                [tableView registerClass:cellClass forCellReuseIdentifier:NSStringFromClass(cellClass)];
                break;
        }
    };
}

- (CGFloat)rowHeight
{
    return 80;
}
- (void)configViewModelWithCellClassName:(NSString *)clsName initType:(ETTableViewCellInitalType)initType tableView:(UITableView *)tableView
{
    self.cellClassName = clsName;
    self.initType = initType;
    self.reuseIdentifier = clsName;
    self.registerBlock(tableView, NSClassFromString(clsName), initType);
    
}

@end
