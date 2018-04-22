//
//  ThirdClass.m
//  Load_Initialize_Demo
//
//  Created by 戴运鹏 on 2018/4/22.
//  Copyright © 2018年 戴运鹏. All rights reserved.
//

#import "ThirdClass.h"

@implementation ThirdClass

+ (void)load
{
    NSLog(@"load---%@",[self class]);
}

//+ (void)initialize
//{
//    if (self == [self class]) {
//    NSLog(@"initialize-啊啊啊啊啊--%@",[self class]);
//    }
//    
//}
@end
