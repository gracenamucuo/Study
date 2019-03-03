//
//  SecController.m
//  Progress_Demo
//
//  Created by 戴运鹏 on 2019/3/2.
//  Copyright © 2019 戴运鹏. All rights reserved.
//

#import "SecController.h"
#import "CustomCell.h"
@interface SecController ()<UITableViewDelegate,UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@end

@implementation SecController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView registerClass:[CustomCell class] forCellReuseIdentifier:@"cellID"];
    self.tableView.rowHeight = [UIScreen mainScreen].bounds.size.width / 2;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 30;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CustomCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellID" forIndexPath:indexPath];

    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}
@end
