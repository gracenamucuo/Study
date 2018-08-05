//
//  ViewController.m
//  iOS动画
//
//  Created by 戴运鹏 on 2017/10/2.
//  Copyright © 2017年 戴运鹏. All rights reserved.
//

#import "ViewController.h"
#import "CABasicAnimationController.h"
@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic,strong)NSMutableArray *dataArray;
@end

static NSString *cellID = @"cellID";
@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:cellID];
    [self.dataArray addObjectsFromArray:@[@"CABasicAnimation",@"CAKeyframeAnimation",@"CAAnimationGroup",@"CATransition",@"CADisplayLink",@"CAShapeLayer"]];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell= [tableView dequeueReusableCellWithIdentifier:cellID forIndexPath:indexPath];
    cell.textLabel.text = self.dataArray[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *vcName = [NSString stringWithFormat:@"%@Controller",self.dataArray[indexPath.row]];
   Class cls = NSClassFromString(vcName);
    [self.navigationController pushViewController:[[cls alloc]init] animated:YES];
    
}

- (NSMutableArray *)dataArray
{
    if (!_dataArray) {
        _dataArray = [NSMutableArray array];
    }
    return _dataArray;
}

- (void)didReceiveMemoryWarning {
   
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end









































