//
//  FactoryMethodCalculateMinus.m
//  Design_Demo
//
//  Created by 戴运鹏 on 2018/5/16.
//  Copyright © 2018年 戴运鹏. All rights reserved.
//

#import "FactoryMethodCalculateMinus.h"

@implementation FactoryMethodCalculateMinus

@synthesize numberA;

@synthesize numberB;

- (CGFloat)calculate {
    return self.numberA - self.numberB;
}

@end
