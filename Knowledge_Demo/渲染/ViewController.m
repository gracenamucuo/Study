//
//  ViewController.m
//  渲染
//
//  Created by 戴运鹏 on 2019/2/27.
//  Copyright © 2019 戴运鹏. All rights reserved.
//

#import "ViewController.h"
#import "DrawVCViewController.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic,strong)NSArray *data;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.data = @[@"drawView"];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cellID"];
    

    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.data.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellID" forIndexPath:indexPath];
    cell.textLabel.text = self.data[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    DrawVCViewController *vc = [[DrawVCViewController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}
@end
