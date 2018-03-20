//
//  CocurrentOperation.m
//  NSOperation_Demo
//
//  Created by 戴运鹏 on 2018/3/20.
//  Copyright © 2018年 戴运鹏. All rights reserved.
//

#import "CocurrentOperation.h"


@interface CocurrentOperation()
@property (nonatomic,strong)id data;
@end

@implementation CocurrentOperation

@synthesize executing = _executing;
@synthesize finished = _finished;

- (instancetype)initWithData:(id)data
{
    if (self = [super init]) {
        self.data = data;
        _executing = NO;
        _finished = NO;
    }
    return self;
}

- (BOOL)isExecuting
{
    return _executing;
}

- (BOOL)isFinished
{
    return _finished;
}


- (void)start
{
    if (self.isCancelled) {
        [self willChangeValueForKey:@"isFinished"];
        _finished = YES;
        [self didChangeValueForKey:@"isFinished"];
        return;
    }
    
    [self willChangeValueForKey:@"isExecuting"];
    
    [NSThread detachNewThreadSelector:@selector(main) toTarget:self withObject:nil];
    _executing = YES;
    
    [self didChangeValueForKey:@"isExecuting"];
}

- (void)main
{
    
    NSString *order = (NSString *)self.data;
    for (NSInteger i = 0; i < 3; i++) {
        NSLog(@"并发执行任务%@----%@",order,[NSThread currentThread]);
    }
    
    [self willChangeValueForKey:@"isExecuting"];
    _executing = NO;
    [self didChangeValueForKey:@"isExecuting"];
    
    [self willChangeValueForKey:@"_finished"];
    _finished = YES;
    [self didChangeValueForKey:@"_finished"];
}

- (BOOL)isConcurrent
{
    return YES;
}

@end











