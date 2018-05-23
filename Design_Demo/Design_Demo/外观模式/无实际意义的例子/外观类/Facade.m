//
//  Facade.m
//  Design_Demo
//
//  Created by 戴运鹏 on 2018/5/18.
//  Copyright © 2018年 戴运鹏. All rights reserved.
//

#import "Facade.h"
#import "SystemOne.h"
#import "SystemTwo.h"
@interface Facade()

@property (nonatomic,strong)SystemOne *one;
@property (nonatomic,strong)SystemTwo *two;

@end

@implementation Facade

- (instancetype)init
{
    self = [super init];
    if (self) {
        _one = [[SystemOne alloc]init];
        _two = [[SystemTwo alloc]init];
    }
    return self;
}

- (void)operation
{
    [self.one systemOneOperation];
    [self.two systemTwoOperation];
}

@end
