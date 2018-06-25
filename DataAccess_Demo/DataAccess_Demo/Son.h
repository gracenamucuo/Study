//
//  Son.h
//  DataAccess_Demo
//
//  Created by 戴运鹏 on 2018/6/23.
//  Copyright © 2018年 戴运鹏. All rights reserved.
//

#import "Person.h"

@interface Son : Person<NSCoding>
@property (nonatomic,copy)NSString *fav;
@end
