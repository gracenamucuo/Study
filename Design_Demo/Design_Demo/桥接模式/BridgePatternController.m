//
//  BridgePatternController.m
//  Design_Demo
//
//  Created by 戴运鹏 on 2018/5/17.
//  Copyright © 2018年 戴运鹏. All rights reserved.
//

#import "BridgePatternController.h"
#import "AbstractMessage.h"
#import "MessageSMS.h"
#import "CommonMessage.h"
#import "AbstractMobile.h"
#import "AppleMobile.h"
#import "MobileImplementProtocol.h"
#import "MobileContractApp.h"
#import "MobileGameApp.h"
@interface BridgePatternController ()

@end

@implementation BridgePatternController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    id<MessageImplementProtocol> messageImp = [[MessageSMS alloc]init];
    AbstractMessage *message = [[CommonMessage alloc]initWithImplement:messageImp];
    [message send: [[NSMutableString alloc]initWithString:@"桥接模式发送普通消息"]];
    
    id<MobileImplementProtocol> appImp = [[MobileGameApp alloc]init];
    AbstractMobile *mobile = [[AppleMobile alloc]initWithMobileImpApp:appImp];
    [mobile useMobile];
    
    
}


@end















































