//
//  AbstracrtMobile.m
//  Design_Demo
//
//  Created by 戴运鹏 on 2018/5/17.
//  Copyright © 2018年 戴运鹏. All rights reserved.
//

#import "AbstractMobile.h"

@implementation AbstractMobile

- (instancetype)initWithMobileImpApp:(id<MobileImplementProtocol>)impApp
{
    if (self = [super init]) {
        _app = impApp;
    }
    return self;
}

- (void)useMobile
{
    
}

@end
