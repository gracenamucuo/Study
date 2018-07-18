//
//  AutoFooterController.m
//  Refresh_Demo
//
//  Created by 戴运鹏 on 2018/7/17.
//  Copyright © 2018年 戴运鹏. All rights reserved.
//

#import "AutoFooterController.h"
#import "MJRefresh.h"
@interface AutoFooterController ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic,strong)UITableView *tableView;
@property (nonatomic,strong)NSMutableArray *dataArray;
@property(nonatomic,strong)MJRefreshAutoFooter *autoFooter;
@end
static NSString *cellID = @"cellID";
@implementation AutoFooterController


- (void)viewDidLoad {
    [super viewDidLoad];
    [self layoutUI];
}
- (void)layoutUI
{
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 64, self.view.frame.size.width, self.view.frame.size.height - 64) style:UITableViewStylePlain];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:cellID];
    MJRefreshAutoGifFooter *refreshFooter = [MJRefreshAutoGifFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadAction)];
    self.tableView.mj_footer = refreshFooter;
    self.autoFooter = refreshFooter;
    NSMutableArray *logoImages = [NSMutableArray array];
    for (NSInteger i = 0; i < 5; i++) {
        UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"loading_a_%ld",i]];
        [logoImages addObject:image];
    }
    [refreshFooter setImages:logoImages forState:MJRefreshStateRefreshing];
    refreshFooter.backgroundColor = [UIColor redColor];
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.tableView];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.tableFooterView = [UIView new];
    
}

- (void)loadAction
{
    
}


#pragma mark --Delegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID forIndexPath:indexPath];
    cell.textLabel.text = @"footer";
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
//    [self.autoFooter endRefreshing];
    [self.autoFooter setState:MJRefreshStateNoMoreData];
}

@end
