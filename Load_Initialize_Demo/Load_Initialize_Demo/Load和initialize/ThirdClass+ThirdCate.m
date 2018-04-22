//
//  ThirdClass+ThirdCate.m
//  Load_Initialize_Demo
//
//  Created by 戴运鹏 on 2018/4/22.
//  Copyright © 2018年 戴运鹏. All rights reserved.
//

#import "ThirdClass+ThirdCate.h"

@implementation ThirdClass (ThirdCate)

+ (void)load
{
    NSLog(@"load---%@----cate",[self class]);
}

//+ (void)initialize
//{
//    NSLog(@"initialize--%@--cate",[self class]);
//}

//                      +load                 +initialize
//调用时机                被添加到 runtime 时    收到第一条消息前，可能永远不调用
//调用顺序                父类->子类->分类        父类->子类
//调用次数                1次                    多次
//是否需要显式调用父类实现   否                     否
//是否沿用父类的实现        否                     是
//分类中的实现            类和分类都执行            覆盖类中的方法，只执行分类的实现

@end
