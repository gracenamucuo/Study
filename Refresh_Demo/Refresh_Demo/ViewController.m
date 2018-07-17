//
//  ViewController.m
//  Refresh_Demo
//
//  Created by 戴运鹏 on 2018/7/16.
//  Copyright © 2018年 戴运鹏. All rights reserved.
//

#import "ViewController.h"
#import "HeaderController.h"
#import "NormalHeaderController.h"
#import "StateHeaderController.h"
#import "GifHeaderController.h"
#import "BackFooterController.h"
#import "AutoFooterController.h"
@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic,strong)NSMutableArray *dataArray;

@end
static NSString *cellID = @"cellID";
@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.dataArray = [NSMutableArray array];
    [self.dataArray addObjectsFromArray:@[@"header",@"StateHeaderController",@"NormalHeaderController",@"GifHeaderController",@"FooterController",@"AutoFooterController"]];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:cellID];
    
    
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID forIndexPath:indexPath];
    cell.textLabel.text = self.dataArray[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        [self headerControllerAction];
    }else if (indexPath.row == 1){
        [self stateHeaderControllerAction];
    }else if (indexPath.row == 2){
        [self normalHeaderControllerAction];
    }else if (indexPath.row == 3){
        [self gifHeaderControllerAction];
    }else if (indexPath.row == 4){
        [self footerControllerAction];
    }else if (indexPath.row == 5){
        [self autoFooterControllerAction];
    }
}

- (void)headerControllerAction
{
    HeaderController *headerVC = [[HeaderController alloc]init];
    [self.navigationController pushViewController:headerVC animated:YES];
}

- (void)stateHeaderControllerAction
{
    StateHeaderController *state = [[StateHeaderController alloc]init];
    [self.navigationController pushViewController:state animated:YES];
}

- (void)normalHeaderControllerAction
{
    NormalHeaderController *normal = [[NormalHeaderController alloc]init];
    [self.navigationController pushViewController:normal animated:YES];
}
- (void)gifHeaderControllerAction
{
    GifHeaderController *gif = [[GifHeaderController alloc]init];
    [self.navigationController pushViewController:gif animated:YES];
}
- (void)footerControllerAction
{
    BackFooterController *footer = [[BackFooterController alloc]init];
    [self.navigationController pushViewController:footer animated:YES];
}

- (void)autoFooterControllerAction
{
    AutoFooterController *footer = [[AutoFooterController alloc]init];
    [self.navigationController pushViewController:footer animated:YES];
}
@end
