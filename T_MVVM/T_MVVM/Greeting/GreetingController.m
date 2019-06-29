//
//  GreetingController.m
//  T_MVVM
//
//  Created by dyp on 2019/6/17.
//  Copyright © 2019 dyp. All rights reserved.
//

#import "GreetingController.h"
#import "GreetingViewModel.h"
#import "Person.h"
#import "Masonry.h"
@interface GreetingController ()
@property (nonatomic,weak)UILabel *greetingLabel;
@property (nonatomic,weak)UIButton *actionBtn;
@property (nonatomic,strong)GreetingViewModel *greetViewModel;
@end

@implementation GreetingController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"欢迎";
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self layoutUI];
    [self configViewModel];
}

- (void)layoutUI
{
    UILabel *greetingLabel = [[UILabel alloc]init];
    greetingLabel.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:greetingLabel];
    self.greetingLabel = greetingLabel;
    [self.greetingLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.view);
        make.centerY.equalTo(self.view.mas_centerY);
    }];
    
    UIButton *actionBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.view addSubview:actionBtn];
    [actionBtn setTitle:@"Greeting" forState:UIControlStateNormal];
    actionBtn.backgroundColor = [UIColor redColor];
    self.actionBtn = actionBtn;
    [actionBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.greetingLabel.mas_bottom).offset(50);
        make.centerX.equalTo(self.view.mas_centerX);
    }];
    
    
    
}

- (void)configViewModel
{
    Person *p1 = [Person new];
    p1.firstName = @"firstName";
    p1.lastName = @"lastName";
    self.greetViewModel = [[GreetingViewModel alloc] initWithPerson:p1];
    __weak typeof(self)weakSelf = self;
    self.greetViewModel.greetingDidChange = ^(id<GreetingViewModelProtocol>  _Nonnull viewModel) {
        weakSelf.greetingLabel.text = viewModel.greeting;
    };
    [self.actionBtn addTarget:self.greetViewModel action:@selector(showGreeting:) forControlEvents:UIControlEventTouchUpInside];
}

/*
 点击按钮 事件交由viewModel处理 viewModel的对应属性改变，触发与其绑定的UI刷新。
 
 */



/**
 vc充当view;vc持有viewModel,点击按钮，viewModel执行事件，改变vm的相关属性(用于在view上的显示)，用相关属性的setter方法绑定vm的回调，执行回调，view的显示更新。
 
 view—————持有—————>vm
 <-------绑定------>
 
 
 */



/**
 表示逻辑:(presentation logic)将model数据转换为View可以呈现的东西的事情，eg:将NSDate转换为一个格式化的NSString;一个状态数字，但是UI需要展示的是文案，就是需要在viewModel中做的事情
 
 iOS使用MVVM的原因:减少VC的复杂性，为VC瘦身，使表示逻辑更易于测试。
 
 对于可变的model,需要使用绑定机制，使ViewModel能在model变化的时候，更新自己的属性【可以通过KVO】，同时view的属性也跟着更新，model的改变级联向下通过ViewModel进入view.
 
 
 把胖model拆成瘦model和viewModel;
 
 Controller夹在view和viewModel之间做将view和viewModel绑定起来的事情。// M -- VM -- C -- V
 Controller还做正常的UI展示布局操作
 
 ViewModel角色作用:表示逻辑(业务逻辑处理);网络处理;缓存处理；不应该引用任何View,也不应该有跳转逻辑
 
 */

/**
 view负责UI的展示，绑定viewModel中的属性【变化的时候,及时更新UI】，触发viewModel中的命令【点击请求网络】;以及呈现viewModel提供的数据。
 */

- (void)dealloc
{
    NSLog(@"%@ ------销毁",[self class]);
}


/**
 
 MVVM involves three layers:
    -- Model  layer---
 • The model layer contains data access objects and validation logic. It knows how to
 read and write data, and it notifies the view model when data changes.
    -- ViewModel  layer---
 • The view model layer contains the state of the view and has methods to handle user
 interaction. It calls methods on the model layer to read and write data, and it notifies
 the view when the model‘s data changes.
    -- view  layer---
 • The view layer styles and displays on-screen elements. It doesn‘t contain business
 or validation logic. Instead, it binds its visual elements to properties on the view
 model. It also receives user inputs and interaction, and it calls methods on the view
 model in response.
 */
@end
