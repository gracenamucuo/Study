//
//  KVOPerson.m
//  类别与扩展
//
//  Created by 戴运鹏 on 2019/2/12.
//  Copyright © 2019 戴运鹏. All rights reserved.
//

#import "KVOPerson.h"

@implementation KVOPerson

- (void)setAge:(NSUInteger)age
{
    _age = age;
    NSLog(@"调用了setter方法");
}

- (void)willChangeValueForKey:(NSString *)key
{
    NSLog(@"将要调用will");
    [super willChangeValueForKey:key];
    
    NSLog(@"调用了will");
}

- (void)didChangeValueForKey:(NSString *)key
{
    if (self.age > 100) {
        return;
    }
    NSLog(@"将要调用did");
    [super didChangeValueForKey:key];
    NSLog(@"已经调用了did");
}

@end
