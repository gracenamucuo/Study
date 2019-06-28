//
//  InputController.m
//  T_MVVM
//
//  Created by dyp on 2019/6/28.
//  Copyright © 2019 dyp. All rights reserved.
//

#import "InputController.h"
#import "Person.h"
#import "InputViewModel.h"
#import <FBKVOController.h>
@interface InputController ()<UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *nameTF;
@property (weak, nonatomic) IBOutlet UITextField *ageTF;
@property (nonatomic,strong)InputViewModel *viewModel;
@property (nonatomic,strong)FBKVOController *kvoController;
@end

@implementation InputController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configViewModel];
    [self configUI];
}

- (void)configViewModel
{
    Person *person = [[Person alloc]init];
    person.firstName = @"王";
    person.lastName = @"五";
    person.age = 20;
    
    self.viewModel = [[InputViewModel alloc]initWithPerson:person];
 

    
    //binder
    __weak typeof(self)weakSelf = self;
    self.kvoController = [[FBKVOController alloc]initWithObserver:self];
    [self.kvoController observe:self.viewModel keyPath:@"name" options:NSKeyValueObservingOptionNew block:^(id  _Nullable observer, id  _Nonnull object, NSDictionary<NSString *,id> * _Nonnull change) {
        if ([object isEqual:self.viewModel]) {
            weakSelf.nameTF.text = [NSString stringWithFormat:@"%@",change[NSKeyValueChangeNewKey]];
        }
    }];
    [self.kvoController observe:self.viewModel keyPath:@"age" options:NSKeyValueObservingOptionNew block:^(id  _Nullable observer, id  _Nonnull object, NSDictionary<NSString *,id> * _Nonnull change) {
        if ([object isEqual:self.viewModel]) {
            weakSelf.ageTF.text = [NSString stringWithFormat:@"%@",change[NSKeyValueChangeNewKey]];
        }
    }];
}

- (void)configUI
{
    self.nameTF.text = self.viewModel.name;
    self.ageTF.text = self.viewModel.age;
    self.nameTF.delegate = self;
    self.ageTF.delegate = self;
}

- (void)textFieldDidEndEditing:(UITextField *)textField
{
    if ([textField isEqual:self.nameTF]) {
        self.viewModel.name = textField.text;
    }
    
    if ([textField isEqual:self.ageTF]) {
        self.viewModel.age = textField.text;
    }
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [super touchesEnded:touches withEvent:event];
    [self.view endEditing:YES];
}
@end
