//
//  ETTableManager.h
//  Base_Demo
//
//  Created by 戴运鹏 on 2018/7/19.
//  Copyright © 2018年 戴运鹏. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ETSectionConvertableProtocol.h"
@class ETTableDelegate;
@interface ETTableManager : NSObject
@property (nonatomic,strong)NSArray <id<ETSectionConvertableProtocol>> *sections;
@property (nonatomic,strong)ETTableDelegate *delegate;
@property (nonatomic,weak)UITableView *tableView;
- (instancetype)initWithSections:(NSArray *)sections tableViewDelegate:(ETTableDelegate*)delegate;
- (void)bindToTableView:(UITableView *)tableView;
- (void)reloadData;
@end
