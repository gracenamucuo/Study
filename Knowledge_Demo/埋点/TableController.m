//
//  TableController.m
//  埋点
//
//  Created by 戴运鹏 on 2019/2/14.
//  Copyright © 2019 戴运鹏. All rights reserved.
//

#import "TableController.h"
#import "CustomCell.h"
#import "Aspects.h"
@interface TableController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation TableController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.tableView aspect_hookSelector:@selector(setDelegate:) withOptions:2 usingBlock:^(id obj){
        NSLog(@"%@",obj);
    } error:nil];
    self.tableView.delegate = self;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CustomCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CellID" forIndexPath:indexPath];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"cell点击了%@",indexPath);
}
@end

