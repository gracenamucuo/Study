//
//  Person.h
//  DataPersistence_Demo
//
//  Created by 戴运鹏 on 2018/6/21.
//  Copyright © 2018年 戴运鹏. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Food;
@interface Person : NSObject
@property (nonatomic,copy)NSString *name;
@property (nonatomic,copy)NSString *age;
@property (nonatomic,strong)Food *food;
/*
如果需要归档的类是某个自定义类的子类时，就需要在归档和解档之前先实现父类的归档和解档方法。即 [super encodeWithCoder:aCoder] 和 [super initWithCoder:aDecoder] 方法;
 */
@end
