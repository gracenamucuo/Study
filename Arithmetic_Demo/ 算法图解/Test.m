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

- (NSSet*)greedyAlgorithm
{
    NSMutableSet *states_needed = [[NSMutableSet alloc]initWithArray:@[@"mt",@"wa",@"or",@"id",@"nv",@"ut",@"ca",@"az"]];
    NSMutableDictionary *stations = [NSMutableDictionary dictionary];
    [stations setObject:[NSSet setWithObjects:@"id",@"nv",@"ut",nil] forKey:@"kone"];
    [stations setObject:[NSSet setWithObjects:@"wa",@"id",@"mt", nil] forKey:@"ktwo"];
    [stations setObject:[NSSet setWithObjects:@"or",@"nv",@"ca", nil] forKey:@"kthree"];
    [stations setObject:[NSSet setWithObjects:@"nv",@"ut", nil] forKey:@"kfour"];
    [stations setObject:[NSSet setWithObjects:@"ca",@"az", nil] forKey:@"kfive"];
    NSMutableSet *final_stations = [NSMutableSet set];

    

    while (states_needed.count > 0) {
        __block NSString *bestStation = nil;
        __block NSMutableSet *states_coverd = [NSMutableSet set];
        [stations enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
            NSMutableSet *covered = [NSMutableSet setWithSet:states_needed];
                [covered intersectSet:obj];
            
            if (covered.count > states_coverd.count) {
                bestStation = key;
                states_coverd = covered;
            }
            

        }];
        [states_needed minusSet:states_coverd];
        [final_stations addObject:bestStation];
        [stations removeObjectForKey:bestStation];
    }
    
  
    return final_stations;
}
@end
