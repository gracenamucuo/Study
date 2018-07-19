//
//  ETTableDelegate.h
//  Base_Demo
//
//  Created by 戴运鹏 on 2018/7/19.
//  Copyright © 2018年 戴运鹏. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ETTableManager;
@interface ETTableDelegate : NSObject<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,weak)ETTableManager *manager;
@end
