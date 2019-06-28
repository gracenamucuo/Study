//
//  LoginController.m
//  T_MVVM
//
//  Created by dyp on 2019/6/25.
//  Copyright © 2019 dyp. All rights reserved.
//

#import "LoginController.h"
#import "LoginViewModel.h"
#import <KVOController.h>

#define WeakSelf __weak typeof(self)weakSelf = self;
#define StrongSelf __strong typeof(weakSelf)strongSelf = weakSelf;
@interface LoginController ()
@property (weak, nonatomic) IBOutlet UITextField *pwdTF;
@property (weak, nonatomic) IBOutlet UIImageView *headerIcon;
@property (weak, nonatomic) IBOutlet UIButton *loginBtn;
@property (nonatomic,strong)LoginViewModel *loginViewModel;
@property (nonatomic,strong)FBKVOController *kvoController;
@end

@implementation LoginController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self configViewModel];
    [self renderUI];
}

- (void)configViewModel
{
   
    WeakSelf
    self.loginViewModel = [[LoginViewModel alloc]init];
    self.KVOController = [FBKVOController controllerWithObserver:self];
    [self.KVOController observe:self.loginViewModel keyPath:@"headerImage" options:NSKeyValueObservingOptionNew block:^(id  _Nullable observer, id  _Nonnull object, NSDictionary<NSString *,id> * _Nonnull change) {
        StrongSelf
        strongSelf.headerIcon.image = [UIImage imageNamed:change[NSKeyValueChangeNewKey]];
    }];
}

- (void)renderUI
{
    self.headerIcon.image = [UIImage imageNamed:self.loginViewModel.headerImage];
    [self.pwdTF addTarget:self action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
}

- (void)textFieldDidChange:(UITextField *)tf
{
    self.loginViewModel.phoneNumber = tf.text;
    self.loginBtn.enabled = self.loginViewModel.loginBtnEnable;
}

- (IBAction)loginAction:(UIButton *)sender {
    if ([self.loginViewModel verifyPhoneNumber:self.pwdTF.text]) {
        [self.loginViewModel loginSuccess:^(NSString * _Nonnull userID) {
            
        } fail:^(NSString * _Nonnull failMsg) {
            
        }];
    }
    
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [super touchesEnded:touches withEvent:event];
    [self.view endEditing:YES];
}

- (void)dealloc
{
    NSLog(@"%@ ------销毁",[self class]);
}
@end
