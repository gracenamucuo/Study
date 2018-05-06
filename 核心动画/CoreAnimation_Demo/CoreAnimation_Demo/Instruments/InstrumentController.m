//
//  InstrumentController.m
//  CoreAnimation_Demo
//
//  Created by 戴运鹏 on 2018/5/3.
//  Copyright © 2018年 戴运鹏. All rights reserved.
//

#import "InstrumentController.h"
#import "DataHelper.h"
@interface InstrumentController ()<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic,strong)NSMutableArray *dataSource;
@end
static NSString *cellID = @"cellID";
@implementation InstrumentController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:cellID];
    self.tableView.rowHeight = 80.f;
    self.tableView.tableFooterView = [UIView new];
    self.dataSource = [NSMutableArray array];
    DataHelper *dataHelper = [[DataHelper alloc]init];
    for (NSInteger i = 0 ; i < 1000; i++) {
        [self.dataSource addObject:@{@"name":[dataHelper randomName],@"image":[dataHelper randomAvatar]}];
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID forIndexPath:indexPath];
    NSDictionary *dic = self.dataSource[indexPath.row];
    NSString *filePath = [[NSBundle mainBundle]pathForResource:dic[@"image"] ofType:@"png"];
    cell.imageView.image = [UIImage imageWithContentsOfFile:filePath];//这个和[UIImage imageNamed]的区别
    cell.textLabel.text = dic[@"name"];
    cell.imageView.layer.shadowOffset = CGSizeMake(0, 5);
    cell.imageView.layer.shadowOpacity = 0.75;
    cell.clipsToBounds = YES;
    
    cell.textLabel.backgroundColor = [UIColor clearColor];
    cell.textLabel.layer.shadowOffset = CGSizeMake(0, 2);
    cell.textLabel.layer.shadowOpacity = 0.5;
//    [self blockMainThread];
    return cell;
}

-(void)blockMainThread{
    for (int i = 0; i < 1000; i++) {
        NSLog(@"%d", i);
    }
}





@end














































