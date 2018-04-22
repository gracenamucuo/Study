//
//  FirstClass.m
//  Load_Initialize_Demo
//
//  Created by 戴运鹏 on 2018/4/22.
//  Copyright © 2018年 戴运鹏. All rights reserved.
//

#import "FirstClass.h"

@implementation FirstClass

+ (void)load
{
    NSLog(@"load---%@",[self class]);
}

//+ (void)initialize
//{
//    if (self == [FirstClass self]) {
//    NSLog(@"initialize----%@",[self class]);
//    }
//
//}
@end
