//
//  ViewController.m
//  T_refresh
//
//  Created by dyp on 2019/6/11.
//  Copyright © 2019 dyp. All rights reserved.
//

#import "ViewController.h"
#import "BaseHeaderController.h"
#import "StateHeaderController.h"
#import "NormalHeaderController.h"
#import "GifHeaderController.h"
#import "CustomHeaderController.h"
#import "BaseFooterController.h"
#import "BackFooterController.h"
@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic,strong)NSArray *dataSource;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.dataSource = @[@"header",@"stateHeader",@"normalHeader",@"gifheader",@"customHeader",@"这一个",@"backFooter"];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cellID"];
    [self.tableView reloadData];
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellID" forIndexPath:indexPath];
    cell.textLabel.text = self.dataSource[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    UIViewController *vc = nil;
    NSString *name = self.dataSource[indexPath.row];
    if ([name isEqualToString:@"header"]) {
        vc = [[BaseHeaderController alloc]init];
    }else if ([name isEqualToString:@"stateHeader"]){
        vc = [[StateHeaderController alloc]init];
    }else if ([name isEqualToString:@"normalHeader"]){
        vc = [[NormalHeaderController alloc]init];
    }else if ([name isEqualToString:@"gifheader"]){
        vc = [[GifHeaderController alloc]init];
    }else if ([name isEqualToString:@"customHeader"]){
        vc = [[CustomHeaderController alloc]init];
    }else if ([name isEqualToString:@"这一个"]){
        vc = [[BaseFooterController alloc]init];
    }else if ([name isEqualToString:@"backFooter"]){
        vc = [[BackFooterController alloc]init];
    }
    [self.navigationController pushViewController:vc animated:YES];
}

@end
