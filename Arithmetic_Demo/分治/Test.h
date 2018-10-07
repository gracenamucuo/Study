//
//  Test.h
//  分治
//
//  Created by 戴运鹏 on 2018/10/7.
//  Copyright © 2018年 戴运鹏. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface Test : NSObject
    //递归求数组和
- (NSInteger)sum:(NSArray*)array;
    
    //快排
- (NSArray *)quicksort:(NSArray *)array;
    
//二分查找
//- (NSInteger)index
@end


