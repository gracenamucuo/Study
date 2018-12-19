//
//  main.m
//  OCTest
//
//  Created by 戴运鹏 on 2018/12/19.
//  Copyright © 2018 戴运鹏. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"



int main(int argc, const char * argv[]) {

    @autoreleasepool {
        Son *son = [[Son alloc]init];
        if ([son isKindOfClass:[Person class]]) {//继承体系的话都会返回YES
            
        }
        
        
        if ([son isMemberOfClass:[Person class]]) {//是具体的当前类
            
        }
        
        
        NSArray* (^test)(void) = ^{
            return [[NSMutableArray alloc] init];
        };
    
        NSMutableArray *a = [NSMutableArray array];
        NSArray *b = test();
        
        if ([b isKindOfClass:[NSMutableArray class]]) {
            NSLog(@"=----%@",[NSMutableArray class]);
        }
        
    }
    return 0;
}

