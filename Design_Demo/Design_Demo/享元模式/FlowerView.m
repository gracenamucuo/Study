//
//  FlowerView.m
//  Design_Demo
//
//  Created by 戴运鹏 on 2018/5/15.
//  Copyright © 2018年 戴运鹏. All rights reserved.
//

#import "FlowerView.h"

@implementation FlowerView


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    [self.image drawInRect:rect];
}


@end
