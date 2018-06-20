//
//  ViewController.m
//  TopScroll_Demo
//
//  Created by 戴运鹏 on 2018/6/19.
//  Copyright © 2018年 戴运鹏. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *topConstraint;
@property (nonatomic,assign)CGFloat offset_Y;
@end
static NSString *cellID = @"cellID";
static CGFloat topViewHeight = 150;
static NSString *headerID = @"HeaderID";
@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:cellID];
    [self.tableView registerClass:[UITableViewHeaderFooterView class] forHeaderFooterViewReuseIdentifier:headerID];
    self.tableView.contentInset = UIEdgeInsetsMake(150, 0, 0, 0);
    self.tableView.rowHeight = 50;

    
}
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    self.offset_Y = scrollView.contentOffset.y;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
    CGFloat d_value = scrollView.contentOffset.y - self.offset_Y;
    CGFloat maxOffsetY = scrollView.contentSize.height - scrollView.frame.size.height;
    
    if (scrollView.contentOffset.y <= -topViewHeight || self.offset_Y <= -topViewHeight) {
        self.topConstraint.constant = 0;
        self.offset_Y = scrollView.contentOffset.y;
        self.tableView.contentInset = UIEdgeInsetsMake(topViewHeight, 0, 0, 0);
        return;
    }

    if (scrollView.contentOffset.y >= maxOffsetY || self.offset_Y >= maxOffsetY) {
        self.topConstraint.constant = maxOffsetY < -topViewHeight ? 0 :  -MIN(topViewHeight+maxOffsetY, topViewHeight);
        self.offset_Y = scrollView.contentOffset.y;
        self.tableView.contentInset = UIEdgeInsetsMake(self.topConstraint.constant+topViewHeight, 0, 0, 0);
        return;
    }

    if (d_value >= 0) {//向上滑动
        self.topConstraint.constant = MAX(self.topConstraint.constant-d_value, -topViewHeight);
        self.tableView.contentInset = UIEdgeInsetsMake(MAX(topViewHeight + self.topConstraint.constant, 0), 0, 0, 0);
    }
    else if (d_value < 0){//向下滑动
        self.topConstraint.constant = MIN(self.topConstraint.constant - d_value, 0);
        self.tableView.contentInset = UIEdgeInsetsMake(MIN(self.topConstraint.constant + topViewHeight, topViewHeight), 0, 0, 0);
    }
    
    self.offset_Y = scrollView.contentOffset.y;
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 12;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID forIndexPath:indexPath];
    cell.textLabel.text = [NSString stringWithFormat:@"第%ld行",indexPath.row];
    return cell;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UITableViewHeaderFooterView *header = [tableView dequeueReusableHeaderFooterViewWithIdentifier:headerID];
    UIView *yellow = [[UIView alloc]init];
    yellow.backgroundColor = [UIColor yellowColor];
    header.backgroundView = yellow;
    return header;
}

- (UIView*)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    return nil;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 30;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0;
}
- (BOOL)prefersStatusBarHidden
{
    return YES;
}

@end
