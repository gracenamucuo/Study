//
//  UITableViewCell+ETRenderUI.h
//  Base_Demo
//
//  Created by 戴运鹏 on 2018/7/19.
//  Copyright © 2018年 戴运鹏. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ETRowConvertableProtocol.h"
@interface UITableViewCell (ETRenderUI)
- (void)renderUIWithModel:(id<ETRowConvertableProtocol>)row;
@end
