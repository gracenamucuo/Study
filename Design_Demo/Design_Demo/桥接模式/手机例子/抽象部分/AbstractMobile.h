//
//  AbstracrtMobile.h
//  Design_Demo
//
//  Created by 戴运鹏 on 2018/5/17.
//  Copyright © 2018年 戴运鹏. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "MobileImplementProtocol.h"
@interface AbstractMobile : NSObject

@property (nonatomic,strong)id<MobileImplementProtocol> app;

- (instancetype)initWithMobileImpApp:(id<MobileImplementProtocol>)impApp;

- (void)useMobile;
@end
