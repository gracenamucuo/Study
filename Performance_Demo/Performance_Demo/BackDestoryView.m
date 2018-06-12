//
//  BackDestoryView.m
//  Performance_Demo
//
//  Created by 戴运鹏 on 2018/6/12.
//  Copyright © 2018年 戴运鹏. All rights reserved.
//

#import "BackDestoryView.h"

@implementation BackDestoryView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (void)dealloc
{
    NSLog(@"%@",[NSThread currentThread]);
    
}


@end
