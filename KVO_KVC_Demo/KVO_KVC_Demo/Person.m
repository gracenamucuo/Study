//
//  Person.m
//  KVO_KVC_Demo
//
//  Created by 戴运鹏 on 2018/4/23.
//  Copyright © 2018年 戴运鹏. All rights reserved.
//

#import "Person.h"

@implementation Person

- (void)setName:(NSString *)name
{
    _name = name;
}

- (void)willChangeValueForKey:(NSString *)key
{
    if ([key isEqualToString:@"name"]) {
//        NSLog(@"将要变换");
    }
    [super willChangeValueForKey:key];

}

- (void)didChangeValueForKey:(NSString *)key
{
    if ([key isEqualToString:@"name"]) {
//        NSLog(@"已经变换");
    }
    [super didChangeValueForKey:key];
  
}

- (void)dealloc
{
    
}

@end
