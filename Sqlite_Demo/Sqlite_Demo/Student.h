//
//  Student.h
//  Sqlite_Demo
//
//  Created by 戴运鹏 on 2018/9/16.
//  Copyright © 2018年 戴运鹏. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ModelProtocol.h"

@interface Student : NSObject<ModelProtocol>
@property (nonatomic,assign)int stuNum;
@property (nonatomic,copy)NSString *name;
@property (nonatomic,assign)int score;
@property (nonatomic,assign)int age;
@end
