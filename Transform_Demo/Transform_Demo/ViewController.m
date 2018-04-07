//
//  ViewController.m
//  Transform_Demo
//
//  Created by 戴运鹏 on 2018/4/6.
//  Copyright © 2018年 戴运鹏. All rights reserved.
//

#import "ViewController.h"
#import "TransformController.h"
#import "UIViewController+LoadController.h"
@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic,strong)NSMutableArray *sectionArray;
@property (nonatomic,strong)NSMutableArray *dataArray;

@end


static NSString *headerID = @"headerID";
static NSString *cellID = @"cellID";
@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:cellID];
    [self.tableView registerClass:[UITableViewHeaderFooterView class] forHeaderFooterViewReuseIdentifier:headerID];
    
    self.sectionArray = [NSMutableArray array];
    self.dataArray = [NSMutableArray array];
    [self.sectionArray addObjectsFromArray:@[@"仿射变换",@"混合变换",@"3D变换",@"透视"]];
    
    [self.dataArray addObject:@[@"CGAffineTransformMakeRotation",@"CGAffineTransformMakeScale",@"CGAffineTransformMakeTranslation"]];
    [self.dataArray addObject:@[@"混合变换"]];
    [self.dataArray addObject:@[@"x",@"y",@"z"]];
    [self.dataArray addObject:@[@"x",@"y",@"z"]];
    
    
}

#pragma® mark -- UITableViewDataSourcr && UITableViewDelegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.sectionArray.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.dataArray[section] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID forIndexPath:indexPath];
    cell.textLabel.text = self.dataArray[indexPath.section][indexPath.row];
    return cell;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *header = [tableView dequeueReusableHeaderFooterViewWithIdentifier:headerID];
    return header;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return self.sectionArray[section];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    TransformController *vc = [TransformController loadFromMainStoryboard];
    if (indexPath.section == 0) {
        vc.method = indexPath.row;
    }else if (indexPath.section == 1){
        vc.method = 3;
    }else if (indexPath.section == 2){
        vc.method = indexPath.row + 4;
    }else if (indexPath.section == 3){
        vc.method = indexPath.row + 7;
    }
    [self.navigationController pushViewController:vc animated:YES];
}

@end





