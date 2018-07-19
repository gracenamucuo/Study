//
//  ETSectionConvertableProtocol.h
//  Base_Demo
//
//  Created by 戴运鹏 on 2018/7/19.
//  Copyright © 2018年 戴运鹏. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ETRowConvertableProtocol.h"

typedef UIView*(^ETSectionBlock)(UITableView *tableView,NSInteger section);
@protocol ETSectionConvertableProtocol <NSObject>
@property (nonatomic,strong)NSArray <id<ETRowConvertableProtocol>> *rows;
@property (nonatomic,copy)ETSectionBlock viewForHeader;
@property (nonatomic,assign)CGFloat heightForHeader;
@property (nonatomic,copy)NSString *headerReuseIdentifier;
@property (nonatomic,copy)NSString *footerReuseIdentifier;
@end
