//
//  BaseRow.m
//  Base_Demo
//
//  Created by 戴运鹏 on 2018/7/19.
//  Copyright © 2018年 戴运鹏. All rights reserved.
//

#import "ETBaseCellViewModel.h"

@implementation ETBaseCellViewModel
@synthesize cellForRowAt;
@synthesize reuseIdentifier;
@synthesize rowHeight;
@synthesize initType;
@synthesize cellClassName;
- (RowCellBlock)cellForRowAt
{
    return ^(UITableView *tableView,NSIndexPath *indexPath){
//        if ([tableView dequeueReusableCellWithIdentifier:self.reuseIdentifier forIndexPath:indexPath]) {
//        return [tableView dequeueReusableCellWithIdentifier:self.reuseIdentifier forIndexPath:indexPath];
//        }
        switch (self.initType) {
            case ETTableViewCellInitalType_Code:
                [tableView registerClass:NSClassFromString(self.cellClassName) forCellReuseIdentifier:self.reuseIdentifier];
                break;
            case ETTableViewCellInitalType_xib:
                [tableView registerNib:[UINib nibWithNibName:self.cellClassName bundle:nil] forCellReuseIdentifier:self.reuseIdentifier];
                break;
        }
        
        return [tableView dequeueReusableCellWithIdentifier:self.reuseIdentifier forIndexPath:indexPath];
    };
}
- (NSString *)reuseIdentifier
{
    return NSStringFromClass([self class]);
}

- (CGFloat)rowHeight
{
    return 44;
}


@end
