//
//  GifHeaderController.m
//  Refresh_Demo
//
//  Created by 戴运鹏 on 2018/7/16.
//  Copyright © 2018年 戴运鹏. All rights reserved.
//

#import "GifHeaderController.h"
#import "MJRefresh.h"
@interface GifHeaderController ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic,strong)UITableView *tableView;
@property (nonatomic,strong)NSMutableArray *dataArray;

@end
static NSString *cellID = @"cellID";
@implementation GifHeaderController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self layoutUI];
    
}
#pragma mark -- header
- (void)refreshAction
{}
- (void)layoutUI
{
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 64, self.view.frame.size.width, self.view.frame.size.height - 64) style:UITableViewStylePlain];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:cellID];
    MJRefreshGifHeader *refreshHeader = [MJRefreshGifHeader headerWithRefreshingTarget:self refreshingAction:@selector(refreshAction)];
    NSMutableArray *images = [NSMutableArray array];
    for (NSInteger i = 0; i < 3; i++) {
        
        UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"dropdown_anim__000%ld",i]];
        [images addObject:image];
    }
    [refreshHeader setImages:images forState:MJRefreshStatePulling];
    [refreshHeader setImages:images forState:MJRefreshStateRefreshing];
    self.tableView.mj_header = refreshHeader;
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.tableView];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
}

#pragma mark --Delegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID forIndexPath:indexPath];
    cell.textLabel.text = @"GifHeaderController";
    return cell;
}
@end