//
//  DataModel.m
//  CoreAnimation_Demo
//
//  Created by 戴运鹏 on 2018/5/3.
//  Copyright © 2018年 戴运鹏. All rights reserved.
//

#import "DataHelper.h"

@implementation DataHelper

- (NSString *)randomName
{
    
    NSArray *first = @[@"Alice", @"Bob", @"Bill", @"Charles", @"Dan", @"Dave", @"Ethan", @"Frank"];
    NSArray *last = @[@"Appleseed", @"Bandicoot", @"Caravan", @"Dabble", @"Ernest", @"Fortune"];
    
    NSInteger index1 = (rand() / (double)INT_MAX) * [first count];
    NSInteger index2 = (rand() / (double)INT_MAX) * [last count];
    
    return [NSString stringWithFormat:@"%@ %@",first[index1],last[index2]];
}

- (NSString *)randomAvatar
{
    NSArray *images = @[@"ball",@"door",@"fire",@"room",@"ship",@"snow"];
   NSInteger index = (rand() / (double)INT_MAX) * [images count];
    return images[index];
}

@end
