//
//  ViewController.m
//  IM_demo
//
//  Created by 戴运鹏 on 2018/9/7.
//  Copyright © 2018年 戴运鹏. All rights reserved.
//

#import "ViewController.h"
#import "TestAttechMent.h"
#import "TestSessionConfig.h"
@interface ViewController ()
@property (nonatomic,strong)TestSessionConfig  *config;
@property (weak, nonatomic) IBOutlet UIButton *loginBtn;
@end

@implementation ViewController

- (instancetype)init
{
    self = [super init];
    if (self) {
        _config = [[TestSessionConfig alloc]init];
    }
    return self;
}
- (IBAction)loginAction:(UIButton *)sender {
    //请将 NIMMyAccount 以及 NIMMyToken 替换成您自己提交到此App下的账号和密码
   
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.session = [NIMSession session:@"1" type:NIMSessionTypeP2P];
    self.titleLabel.textColor = [UIColor blackColor];
    self.titleLabel.font = [UIFont fontWithName:@"Arial" size:14.f];
    self.subTitleLabel.textColor = [UIColor blackColor];
    self.subTitleLabel.font = [UIFont fontWithName:@"Arial" size:11.f];
}

- (NSString *)sessionTitle
{
    return @"主标题";
}

- (NSString *)sessionSubTitle
{
    return @"子标题";
}

- (id<NIMSessionConfig>)sessionConfig
{
    return self.config;
}

#pragma mark - Private
- (void)sendCustomMessage{
    //构造自定义内容
    TestAttechMent *attachment = [[TestAttechMent alloc] init];
    attachment.title = @"这是一条自定义消息";
    attachment.subTitle = @"这是自定义消息的副标题";
    
    //构造自定义MessageObject
    NIMCustomObject *object = [[NIMCustomObject alloc] init];
    object.attachment = attachment;
    
    //构造自定义消息
    NIMMessage *message = [[NIMMessage alloc] init];
    message.messageObject = object;
    
    //发送消息
    [[NIMSDK sharedSDK].chatManager sendMessage:message toSession:self.session error:nil];
}


@end
