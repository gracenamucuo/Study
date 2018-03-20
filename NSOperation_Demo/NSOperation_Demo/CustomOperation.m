//
//  CustomOperation.m
//  NSOperation_Demo
//
//  Created by 戴运鹏 on 2018/3/20.
//  Copyright © 2018年 戴运鹏. All rights reserved.
//

#import "CustomOperation.h"

@interface CustomOperation()
@property (nonatomic,strong)id data;
@end

@implementation CustomOperation
- (instancetype)initWithData:(id)data
{
    if (self = [super init]) {
        self.data = data;
    }
    return self;
}

- (void)main//只重写了这个方法的话，如果单独手动执行该自定义操作的话，操作时同步执行的，如果操作队列联合起来使用的话，也会并发执行操作。
{
    NSString *order = (NSString *)self.data;
    for (NSInteger i = 0; i < 3; i++) {
        NSLog(@"自定义操作%@----:%@",order,[NSThread currentThread]);
    }
}

@end
