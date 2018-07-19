//
//  ETBaseSection.m
//  Base_Demo
//
//  Created by 戴运鹏 on 2018/7/19.
//  Copyright © 2018年 戴运鹏. All rights reserved.
//

#import "ETBaseSectionViewModel.h"

@implementation ETBaseSectionViewModel
@synthesize viewForHeader;
@synthesize heightForHeader;
@synthesize rows;
@synthesize headerReuseIdentifier;
@synthesize footerReuseIdentifier;
- (ETSectionBlock)viewForHeader
{
    return ^(UITableView *tableView,NSInteger section){
        return [tableView dequeueReusableHeaderFooterViewWithIdentifier:self.headerReuseIdentifier];
    };
}

- (CGFloat)heightForHeader
{
    return 50;
}

- (NSString *)headerReuseIdentifier
{
    return NSStringFromClass([self class]);
}



@end
