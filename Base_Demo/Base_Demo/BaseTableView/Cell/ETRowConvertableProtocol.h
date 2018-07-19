//
//  ETRowConvertableProtocol.h
//  Base_Demo
//
//  Created by 戴运鹏 on 2018/7/19.
//  Copyright © 2018年 戴运鹏. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef NS_ENUM(NSUInteger, ETTableViewCellInitalType) {
    ETTableViewCellInitalType_Code = 0,
    ETTableViewCellInitalType_xib
};
typedef UITableViewCell *(^RowCellBlock)(UITableView *tableView,NSIndexPath *indexPath);

@protocol ETRowConvertableProtocol <NSObject>
@property (nonatomic,copy)RowCellBlock cellForRowAt;
@property (nonatomic,copy)NSString *reuseIdentifier;
@property (nonatomic,assign)CGFloat rowHeight;
@property (nonatomic,assign)ETTableViewCellInitalType initType;
@property (nonatomic,copy)NSString *cellClassName;
@end
