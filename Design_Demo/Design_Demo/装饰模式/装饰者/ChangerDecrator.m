//
//  ChangerDecrator.m
//  Design_Demo
//
//  Created by 戴运鹏 on 2018/5/17.
//  Copyright © 2018年 戴运鹏. All rights reserved.
//

#import "ChangerDecrator.h"

@implementation ChangerDecrator

- (void)move
{
    if (self.transformer) {
        [self.transformer move];
    }
}

@end
