//
//  BaseRow.h
//  Base_Demo
//
//  Created by 戴运鹏 on 2018/7/19.
//  Copyright © 2018年 戴运鹏. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ETRowConvertableProtocol.h"
@interface ETBaseCellViewModel : NSObject<ETRowConvertableProtocol>
@property (nonatomic,copy)NSString *title;
@property (nonatomic,copy)NSString *icon;
@end
