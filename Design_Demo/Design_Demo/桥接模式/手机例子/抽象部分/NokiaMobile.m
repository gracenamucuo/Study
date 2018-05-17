//
//  NokiaMobile.m
//  Design_Demo
//
//  Created by 戴运鹏 on 2018/5/17.
//  Copyright © 2018年 戴运鹏. All rights reserved.
//

#import "NokiaMobile.h"

#import "MobileImplementProtocol.h"

@implementation NokiaMobile

- (void)useMobile
{
    NSLog(@"我在诺基亚的手机上玩");

    [self.app runQQ];
    [self.app runWeChat];
    
}

@end
