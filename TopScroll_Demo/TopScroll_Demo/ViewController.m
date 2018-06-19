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
@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:cellID];
    self.tableView.contentInset = UIEdgeInsetsMake(150, 0, 0, 0);
    self.tableView.rowHeight = 50;
    
}
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    self.offset_Y = scrollView.contentOffset.y;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
    CGFloat d_value = scrollView.contentOffset.y - self.offset_Y;
        NSLog(@"%f  %f  %f",d_value,scrollView.contentOffset.y,self.topConstraint.constant);
    if (scrollView.contentOffset.y <= -topViewHeight || scrollView.contentOffset.y >=(scrollView.contentSize.height  - scrollView.frame.size.height)) {
        return;
    }
    

    if (d_value >= 0) {//向上滑动
        
        self.topConstraint.constant = MAX(self.topConstraint.constant-d_value, -topViewHeight);
        self.tableView.contentInset = UIEdgeInsetsMake(MAX(self.topConstraint.constant + topViewHeight, 0), 0, 0, 0);
    }else{//向下滑动
        self.topConstraint.constant = MIN(self.topConstraint.constant - d_value, 0);
        self.tableView.contentInset = UIEdgeInsetsMake(MIN(self.topConstraint.constant+ topViewHeight, topViewHeight), 0, 0, 0);
    }
    
    self.offset_Y = scrollView.contentOffset.y;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 40;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID forIndexPath:indexPath];
    cell.textLabel.text = [NSString stringWithFormat:@"第%ld行",indexPath.row];
    return cell;
}

- (BOOL)prefersStatusBarHidden
{
    return YES;
}

@end
