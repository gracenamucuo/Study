//
//  FactoryMethodCalculateDivide.m
//  Design_Demo
//
//  Created by 戴运鹏 on 2018/5/16.
//  Copyright © 2018年 戴运鹏. All rights reserved.
//

#import "FactoryMethodCalculateDivide.h"

@implementation FactoryMethodCalculateDivide

@synthesize numberA;

@synthesize numberB;

- (CGFloat)calculate {
    if (self.numberB == 0) {
        assert(self.numberB);
    }
    
    return self.numberA / self.numberB;
}

@end
