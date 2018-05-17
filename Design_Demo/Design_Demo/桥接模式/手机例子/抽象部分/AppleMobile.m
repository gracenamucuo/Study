//
//  AppleMobile.m
//  Design_Demo
//
//  Created by 戴运鹏 on 2018/5/17.
//  Copyright © 2018年 戴运鹏. All rights reserved.
//

#import "AppleMobile.h"

#import "MobileImplementProtocol.h"
@implementation AppleMobile

- (void)useMobile
{
    NSLog(@"我在苹果手机上玩");
    [self.app runCardGame];
    [self.app runPlayGame];
}

@end
