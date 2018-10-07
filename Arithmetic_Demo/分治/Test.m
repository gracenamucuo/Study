//
//  Test.m
//  分治
//
//  Created by 戴运鹏 on 2018/10/7.
//  Copyright © 2018年 戴运鹏. All rights reserved.
//

#import "Test.h"

@implementation Test
    
    - (NSInteger)sum:(NSArray*)array
    {
        NSInteger total = 0;
        if (array.count > 1) {
            total = [[NSString stringWithFormat:@"%@",array[0]] integerValue] + [self sum:[self other:array]];
        }else if(array.count == 1){
            total = [[NSString stringWithFormat:@"%@",array[0]] integerValue];
        }else{
            total = 0;
        }
        
        return total;
    }
    
    - (NSArray *)other:(NSArray *)original
    {
        NSMutableArray *other = [NSMutableArray array];
        for (NSInteger i = 1; i < original.count; i++) {
            [other addObject:original[i]];
        }
        return other;
    }
    
- (NSArray *)quicksort:(NSArray *)array
{
    if (array.count < 2) {
        return array;
    }else{
        NSInteger pivot = [array[0] integerValue];
        NSArray *small = [self findUnEaqualWithNum:pivot bigOrSmall:NO inOriginal:array];
        NSArray *big = [self findUnEaqualWithNum:pivot bigOrSmall:YES inOriginal:array];
        NSMutableArray *total = [NSMutableArray array];
        [total addObjectsFromArray:[self quicksort:small]];
        [total addObject:@(pivot)];
        [total addObjectsFromArray:[self quicksort:big]];
        return total;
        
    }
   
}
    
    - (NSArray *)findUnEaqualWithNum:(NSInteger)num bigOrSmall:(BOOL)big inOriginal:(NSArray *)original
    {
        NSMutableArray *arr = [NSMutableArray array];
        
            for (NSInteger i = 1; i < original.count; i++) {
                if (big) {
                    if ([original[i] integerValue] > num) {
                        [arr addObject:original[i]];
                    }
                }
                
                if (!big) {
                    if ([original[i] integerValue] <= num) {
                        [arr addObject:original[i]];
                    }
                }
            }
        
        return arr;
    }
    
@end
