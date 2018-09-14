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
#import "Masonry.h"
#import "ETIMSessionTableViewDataSource.h"
@interface ViewController ()<UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic,strong)CellFactory *cellFactory;
@property (weak, nonatomic) IBOutlet ETIMInputView *inputView;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *Hconstraint;
@property (nonatomic,assign)CGFloat height;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *bottomConstraint;
@property (nonatomic,strong)ETIMSessionTableViewDataSource *dataSource;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.cellFactory = [[CellFactory alloc]init];
    [self.tableView reloadData];
    self.tableView.tableFooterView = [UIView new];
    [self layoutUI];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillChangeFrame:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
    self.tableView.contentInset = UIEdgeInsetsMake(0, 0, 50, 0);
    self.tableView.rowHeight = 50;
    ETIMSessionTableViewDataSource *dataSource = [[ETIMSessionTableViewDataSource alloc]initWithTableView:self.tableView];
    self.dataSource = dataSource;
//    NSString *str = @"😁😢⤴️👀🤡🤠😙🀂🀀🦆🦆🙊🙊🌶🥔🥓🍇🍅🤾‍♀️🤺🏂🚌🚜🚚⏳🔋📺💴💶♏️♍️🔯💔☯️♏️🆘🇧🇴🇧🇪";
//    NSData *data = [str dataUsingEncoding:NSUTF8StringEncoding];
//    [self.inputView setText:[[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding]];
    
    
}
-(void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    if ([self.dataSource totalCount] > 0) {
        [self.tableView scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:[self.dataSource totalCount]-1 inSection:0] atScrollPosition:UITableViewScrollPositionNone animated:YES];
    }
    

}

#pragma mark -- InputUI
- (void)layoutUI
{
    __weak typeof(self) weakSelf = self;
    self.inputView.hBlock = ^(CGFloat height) {
        weakSelf.Hconstraint.constant = height;
    };
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [super touchesBegan:touches withEvent:event];
    [[[UIApplication sharedApplication]keyWindow]endEditing:YES];
    [self.view endEditing:YES];
}

- (void)keyboardWillChangeFrame:(NSNotification *)notification
{
    NSDictionary *userInfo = notification.userInfo;
    CGRect endFrame   = [userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue];
//    if (endFrame.size.height< 260) {
//        return;
//    }
    

    self.bottomConstraint.constant = endFrame.size.height;
    double time = [userInfo[UIKeyboardAnimationDurationUserInfoKey] doubleValue];
    self.tableView.contentInset = UIEdgeInsetsMake(0, 0, self.bottomConstraint.constant+50, 0);

    [UIView animateWithDuration:time animations:^{
        [self.view layoutIfNeeded];
    } completion:^(BOOL finished) {
    }];
}

- (void)keyboardWillHide:(NSNotification *)notification
{
    
     double time = [notification.userInfo[UIKeyboardAnimationDurationUserInfoKey] doubleValue];
    self.bottomConstraint.constant = 0;
    self.tableView.contentInset = UIEdgeInsetsMake(0, 0, self.bottomConstraint.constant+50, 0);

    [UIView animateWithDuration:time animations:^{
        [self.view layoutIfNeeded];
    } completion:^(BOOL finished) {
    }];

}



@end
