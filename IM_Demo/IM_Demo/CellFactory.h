//
//  CellFactory.h
//  IM_Demo
//
//  Created by 戴运鹏 on 2018/9/11.
//  Copyright © 2018年 戴运鹏. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@class ETIMMsgModel;
@interface CellFactory : NSObject
- (UITableViewCell *)redCellInTable:(UITableView *)table model:(NSString *)model;
- (UITableViewCell *)greenCellInTable:(UITableView *)table model:(NSString *)model;
- (UITableViewCell *)cellInTable:(UITableView *)table model:(ETIMMsgModel *)model;
@end
