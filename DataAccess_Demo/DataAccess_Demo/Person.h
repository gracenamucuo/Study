//
//  Person.h
//  DataAccess_Demo
//
//  Created by 戴运鹏 on 2018/6/22.
//  Copyright © 2018年 戴运鹏. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject<NSCoding>

@property (nonatomic,copy)NSString *name;
@property (nonatomic,copy)NSString *age;

@end
