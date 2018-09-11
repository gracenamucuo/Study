//
//  CellFactory.h
//  IM_Demo
//
//  Created by 戴运鹏 on 2018/9/11.
//  Copyright © 2018年 戴运鹏. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface CellFactory : NSObject
- (UITableViewCell *)redCellInTable:(UITableView *)table;
- (UITableViewCell *)greenCellInTable:(UITableView *)table;
@end
