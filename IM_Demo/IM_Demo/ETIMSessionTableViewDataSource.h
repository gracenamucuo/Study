//
//  ETIMSessionTableViewDataSource.h
//  IM_Demo
//
//  Created by 戴运鹏 on 2018/9/13.
//  Copyright © 2018年 戴运鹏. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface ETIMSessionTableViewDataSource : NSObject

- (instancetype)initWithTableView:(UITableView *)table;
- (NSInteger)totalCount;
@end
