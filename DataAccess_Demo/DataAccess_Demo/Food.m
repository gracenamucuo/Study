//
//  Food.m
//  DataAccess_Demo
//
//  Created by 戴运鹏 on 2018/6/23.
//  Copyright © 2018年 戴运鹏. All rights reserved.
//

#import "Food.h"
#import "MacroDefine.h"
@implementation Food
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    initCoderRuntime([self class])
}
//
- (void)encodeWithCoder:(NSCoder *)aCoder
{
    encodeRuntime([self class])
}

@end
