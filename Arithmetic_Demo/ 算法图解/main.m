//
//  main.m
//  分治
//
//  Created by 戴运鹏 on 2018/10/7.
//  Copyright © 2018年 戴运鹏. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Test.h"
int main(int argc, const char * argv[]) {
    @autoreleasepool {
//        NSArray *arr = @[@98,@7,@8,@55,@5,@9,@44,@98,@7,@8,@55,@5,@9,@44];
//        Test *t = [Test new];
////        NSLog(@"哈哈哈 %ld",(long)[t sum:arr]);
//        NSLog(@"%@",[t quicksort:arr]);
          Test *t = [[Test alloc]init];
        NSLog(@"%@", [t greedyAlgorithm]);
    }
    return 0;
}



