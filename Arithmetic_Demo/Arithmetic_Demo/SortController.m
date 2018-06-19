//
//  SortController.m
//  Arithmetic_Demo
//
//  Created by 戴运鹏 on 2018/6/19.
//  Copyright © 2018年 戴运鹏. All rights reserved.
//

#import "SortController.h"

@interface SortController ()
@property (nonatomic,strong)NSMutableArray *data;
@end

@implementation SortController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.data = [NSMutableArray array];
    [self.data addObjectsFromArray:@[@11,@1,@34,@45,@(-111),@0]];
    [self sort];
}

- (void)sort{
    NSInteger count = self.data.count %2 == 0 ? (self.data.count / 2) : (self.data.count + 1) / 2;
    NSInteger min = [self.data[0] integerValue];
    NSInteger min_index = 0;
    NSInteger max = [self.data[0] integerValue];
    NSInteger max_index = 0;
    NSInteger total = self.data.count;
    for (NSInteger i = 0; i < count; i++) {
//        NSInteger max_temp = MAX([self.data[i] integerValue],[self.data[total - i - 1] integerValue]);
//        NSInteger min_temp = MIN([self.data[i] integerValue], [self.data[total - i - 1] integerValue]);
        NSInteger max_temp = [self.data[i] integerValue] >= [self.data[total - i - 1] integerValue] ? [self.data[i] integerValue]  : [self.data[total - i - 1] integerValue];
        NSInteger min_temp = [self.data[i] integerValue] <= [self.data[total - i - 1] integerValue] ? [self.data[i] integerValue] : [self.data[total - i - 1] integerValue];
        
    NSInteger  min_index_temp = [self.data[i] integerValue] <= [self.data[total - i - 1] integerValue] ? i : (total - i - 1);
        NSLog(@"中间小%ld",min_index_temp);
    NSInteger max_index_temp = [self.data[i] integerValue] >= [self.data[total - i - 1] integerValue] ? i : (total - i - 1);
     NSLog(@"中间大%ld",max_index_temp);
        
        min = min > min_temp ? min_temp : min;
        min_index = min >= min_temp ? min_index_temp : min_index;
        NSLog(@"小%ld",min_index);
        max = max < max_temp ? max_temp : max;
        max_index = max <= max_temp ? max_index_temp : max_index;
        NSLog(@"大%ld",max_index);
    }
    
    NSLog(@"最大值%ld 最大值索引%ld 最小值%ld  最小值索引%ld",max,min,max_index,min_index);
}

@end




