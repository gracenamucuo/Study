//
//  AlertFactory.m
//  Design_Demo
//
//  Created by 戴运鹏 on 2019/1/23.
//  Copyright © 2019 戴运鹏. All rights reserved.
//

#import "AlertFactory.h"
#import "ConfirmAlert.h"
#import "SelectAlert.h"
#import "UIView+loadFromNib.h"
@implementation AlertFactory

+ (id<AlertShowProtocol>)createConfirmAlert
{
    ConfirmAlert *confirm = [ConfirmAlert loadFromNib];
    return confirm;
}

+ (id<AlertShowProtocol>)createSelectAlert
{
    SelectAlert *select = [SelectAlert loadFromNib];
    return select;
}

@end
