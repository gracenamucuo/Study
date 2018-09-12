//
//  ViewController.m
//  IM_Demo
//
//  Created by 戴运鹏 on 2018/9/11.
//  Copyright © 2018年 戴运鹏. All rights reserved.
//

#import "ViewController.h"
#import "CellFactory.h"
#import "ETIMInputView.h"
@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic,strong)CellFactory *cellFactory;
@property (nonatomic,strong)ETIMInputView *inputView;
@property (nonatomic,assign)CGFloat height;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.cellFactory = [[CellFactory alloc]init];
    [self.tableView reloadData];
    self.tableView.tableFooterView = [UIView new];
    [self layoutUI];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillChangeFrame:) name:UIKeyboardWillChangeFrameNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];

}

-(void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    if ([self tableView:self.tableView numberOfRowsInSection:0]>0) {
        [self.tableView scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:[self tableView:self.tableView numberOfRowsInSection:0]-1 inSection:0] atScrollPosition:UITableViewScrollPositionNone animated:YES];
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = nil;
    if (indexPath.row % 2 == 0) {
        cell = [self.cellFactory redCellInTable:tableView model:[NSString stringWithFormat:@"%ld",(long)indexPath.row]];
    }else{
        cell = [self.cellFactory greenCellInTable:tableView model:[NSString stringWithFormat:@"%ld",(long)indexPath.row]];
    }
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50;
}

#pragma mark -- InputUI
- (void)layoutUI
{
    ETIMInputView *inputView = [[ETIMInputView alloc]initWithInputType:ETIMInputViewType_text];
    inputView.frame = CGRectMake(0, self.view.frame.size.height - 50, self.view.frame.size.width, 50);
    self.inputView = inputView;
    __weak typeof(self) weakSelf = self;
    self.inputView.hBlock = ^(CGFloat height) {
        weakSelf.height = height;
//            weakSelf.inputView.frame =CGRectMake(0, weakSelf.view.frame.size.height - 50, weakSelf.view.frame.size.width, weakSelf.height>0?weakSelf.height:50);
        CGRect frame = weakSelf.inputView.frame;
        frame.size.height = height;
        weakSelf.inputView.frame = frame;
        [weakSelf.inputView layoutIfNeeded];
    };
    [self.view addSubview:inputView];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [super touchesBegan:touches withEvent:event];
    [self.view endEditing:YES];
}

- (void)keyboardWillChangeFrame:(NSNotification *)notification
{
    NSDictionary *userInfo = notification.userInfo;
    CGRect endFrame   = [userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue];
//    _isVisiable = endFrame.origin.y != [UIApplication sharedApplication].keyWindow.frame.size.height;
//    _keyboardHeight = _isVisiable? endFrame.size.height: 0;
//    [[NSNotificationCenter defaultCenter] postNotificationName:NIMKitKeyboardWillChangeFrameNotification object:nil userInfo:notification.userInfo];
    
    [UIView animateWithDuration:0.3 animations:^{
        self.inputView.frame = CGRectMake(0, self.view.frame.size.height-50-endFrame.size.height, self.view.frame.size.width, self.height>0?self.height:50);
    } completion:^(BOOL finished) {
        [self.inputView setNeedsLayout];
    }];
}



- (void)keyboardWillHide:(NSNotification *)notification
{
//    _isVisiable = NO;
//    _keyboardHeight = 0;
//    [[NSNotificationCenter defaultCenter] postNotificationName:NIMKitKeyboardWillHideNotification object:nil userInfo:notification.userInfo];
    
    [UIView animateWithDuration:0.3 animations:^{
        self.inputView.frame =CGRectMake(0, self.view.frame.size.height - 50, self.view.frame.size.width, self.height>0?self.height:50);
    } completion:^(BOOL finished) {
        [self.inputView setNeedsLayout];
    }];
}



@end
