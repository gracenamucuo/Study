//
//  MenuItemLeaf.m
//  Design_Demo
//
//  Created by 戴运鹏 on 2018/5/18.
//  Copyright © 2018年 戴运鹏. All rights reserved.
//

#import "MenuItemLeaf.h"

@implementation MenuItemLeaf

- (instancetype)initMenuItemLeafWithName:(NSString *)name desc:(NSString *)desc price:(CGFloat)price isVege:(BOOL)isvege
{
    if (self = [super init]) {
        _name = name;
        _desc = desc;
        _isVegetarain = isvege;
        _price = price;
    }
    return self;
}

- (CGFloat)getPrice
{
    return self.price;
}

- (NSString *)getName
{
    return self.name;
}

- (NSString *)getDescription
{
    return self.desc;
}

- (BOOL)isIsVegetarain
{
    return self.isVegetarain;
}

- (void)print
{
    NSLog(@"菜品名称:%@  | 菜品价格:%f | 菜品描述:%@ | 是否是素菜%@",self.name,self.price,self.desc,self.isVegetarain?@"是":@"不是");
}

@end
