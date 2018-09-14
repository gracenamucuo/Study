//
//  ETIMMsgModel.h
//  IM_Demo
//
//  Created by 戴运鹏 on 2018/9/13.
//  Copyright © 2018年 戴运鹏. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ETIMMsgModel : NSObject
@property (nonatomic,copy)NSString *type;
@property (nonatomic,copy)NSString *msg;
- (instancetype)initWithType:(NSString *)type message:(NSString *)msg;
//@property (nonatomic,copy)NSString *msg;
@end
