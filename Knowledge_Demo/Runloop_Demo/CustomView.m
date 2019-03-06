//
//  CustomView.m
//  Runloop_Demo
//
//  Created by 戴运鹏 on 2019/3/6.
//  Copyright © 2019 戴运鹏. All rights reserved.
//

#import "CustomView.h"

@implementation CustomView


// Only override drawRect: if you perform custom drawing.

- (void)drawRect:(CGRect)rect {
  NSLog(@"%@:%@",[self class],NSStringFromSelector(_cmd));
}

- (void)layoutSubviews
{
    [super layoutSubviews];
   NSLog(@"%@:%@",[self class],NSStringFromSelector(_cmd));
}



@end
