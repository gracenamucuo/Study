//
//  UserModel.h
//  Model_Demo
//
//  Created by 戴运鹏 on 2018/6/27.
//  Copyright © 2018年 戴运鹏. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "YYModel.h"
@interface UserModel : NSObject<YYModel>

@property (nonatomic,copy)NSString *name;
@property (nonatomic,copy)NSString *age;

@end