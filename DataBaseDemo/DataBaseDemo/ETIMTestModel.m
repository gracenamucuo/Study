//
//  ETIMTestModel.m
//  DataBaseDemo
//
//  Created by 戴运鹏 on 2018/9/19.
//  Copyright © 2018年 戴运鹏. All rights reserved.
//

#import "ETIMTestModel.h"

@implementation ETIMTestModel

- (instancetype)initWithName:(NSString *)name model_id:(NSString *)model_id age:(NSInteger)age
{
    if (self = [super init]) {
        _name = name;
        _model_id = model_id;
        _age = age;
    }
    return self;
}

@end
