//
//  ETTableViewDataSource.h
//  Base_Demo
//
//  Created by 戴运鹏 on 2018/7/23.
//  Copyright © 2018年 戴运鹏. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@class ETTableViewBaseItem;

@protocol ETTableViewDataSouce<UITableViewDataSource>
@optional
- (ETTableViewBaseItem *)tableView:(UITableView *)tableView objectForRowAtIndexPath:(NSIndexPath *)indexPath;
- (Class)tableView:(UITableView *)tableView cellClassForObject:(ETTableViewBaseItem *)object;

@end


@interface ETTableViewDataSource : NSObject<ETTableViewDataSouce>
@property (nonatomic,strong)NSMutableArray *sections;
- (void)clearAllItems;
- (void)appendItem:(ETTableViewBaseItem *)item;
@end
