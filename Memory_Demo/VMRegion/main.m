//
//  main.m
//  VMRegion
//
//  Created by 戴运鹏 on 2018/7/29.
//  Copyright © 2018年 戴运鹏. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CustomObj.h"
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSMutableSet *objs = [NSMutableSet new];
        for (int i = 0; i < 1000; i++) {
            CustomObj *obj = [CustomObj new];
            [objs addObject:obj];
        }
        sleep(100000);
    }
    return 0;
}
