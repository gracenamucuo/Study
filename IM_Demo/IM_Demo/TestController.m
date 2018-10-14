//
//  TestController.m
//  IM_Demo
//
//  Created by 戴运鹏 on 2018/10/14.
//  Copyright © 2018年 戴运鹏. All rights reserved.
//

#import "TestController.h"
#import "ETIMInputView.h"
#import "CellFactory.h"
#import "ETIMSessionTableViewDataSource.h"
#import "IMTableView.h"
#define WIDTH self.view.frame.size.width
#define HEIGHT self.view.frame.size.height
@interface TestController ()<ETIMInputViewDelegate>
@property (nonatomic,strong)IMTableView *tableView;
@property (nonatomic,strong)ETIMInputView *inputView;
@property (nonatomic,strong)CellFactory *cellFactory;
@property (nonatomic,strong)ETIMSessionTableViewDataSource *tableData;
@end

@implementation TestController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor redColor];
    [self createUI];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillChangeFrame:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
    
}

- (void)createUI
{
      self.cellFactory = [[CellFactory alloc]init];
    ETIMSessionTableViewDataSource *dataSource = [[ETIMSessionTableViewDataSource alloc]initWithTableView:self.tableView];
    self.tableData = dataSource;
    [self.view addSubview:self.tableView];
    self.tableView.rowHeight = 50;
    self.tableView.tableFooterView = [UIView new];
    self.inputView.delegate = self;
    [self.view addSubview:self.inputView];
    
    __weak typeof(self) weakSelf = self;
    self.inputView.hBlock = ^(CGFloat height) {
        CGRect inputFrame = weakSelf.inputView.frame;
        CGRect tableFrame = weakSelf.tableView.frame;
        CGFloat h_dif = height - inputFrame.size.height;
        inputFrame.origin.y -= h_dif;
        inputFrame.size.height = height;
        tableFrame.origin.y -= h_dif;
        
        [UIView animateWithDuration:0.25 animations:^{
            weakSelf.tableView.frame = tableFrame;
            weakSelf.inputView.frame = inputFrame;
        }];

    };
}

- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    self.tableView.frame = CGRectMake(0, 0, WIDTH, HEIGHT - 50);
    self.inputView.frame = CGRectMake(0, HEIGHT-50, WIDTH, 50);


}

- (void)keyboardWillChangeFrame:(NSNotification *)noti
{
    float duration = [noti.userInfo[UIKeyboardAnimationDurationUserInfoKey] floatValue];
    CGRect endframe = [noti.userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue];
    
    CGRect tableFrame = self.tableView.frame;
    CGRect inputFrame = self.inputView.frame;
    tableFrame.origin.y  = tableFrame.origin.y - endframe.size.height;
    inputFrame.origin.y = inputFrame.origin.y - endframe.size.height;
    [UIView animateWithDuration:duration animations:^{
        self.tableView.frame = tableFrame;
        self.inputView.frame = inputFrame;
    }];
    
}

- (void)keyboardWillHide:(NSNotification *)noti
{
    float duration = [noti.userInfo[UIKeyboardAnimationDurationUserInfoKey] floatValue];
    CGRect endframe = [noti.userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue];
    CGRect tableFrame = self.tableView.frame;
    CGRect inputFrame = self.inputView.frame;
    tableFrame.origin.y  = tableFrame.origin.y + endframe.size.height;
    inputFrame.origin.y = inputFrame.origin.y + endframe.size.height;
    [UIView animateWithDuration:duration animations:^{
        self.tableView.frame = tableFrame;
        self.inputView.frame = inputFrame;
    }];
}

- (void)didSendMessage:(NSString *)msg
{
    [self.tableData addNewMessage:msg];
}

- (IMTableView *)tableView
{
    if (!_tableView) {
        _tableView = [[IMTableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
        
    }
    return _tableView;
}

- (ETIMInputView *)inputView
{
    if (!_inputView) {
        _inputView = [[ETIMInputView alloc]initWithInputType:ETIMInputViewType_text];
        
    }
    return _inputView;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
