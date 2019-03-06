//
//  ViewController.m
//  Runloop_Demo
//
//  Created by 戴运鹏 on 2019/2/18.
//  Copyright © 2019 戴运鹏. All rights reserved.
//


#import "ViewController.h"
#import "RunloopCustomCell.h"
#import "SecViewController.h"
#import "UIViewController+loadFromStoryBoard.h"
typedef void(^RenderBlock)(void);

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic,assign)CFRunLoopObserverRef obsever;
@property (nonatomic,strong)NSMutableArray *dataArray;
@end
static NSString *cellID = @"cellID";
@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.rowHeight = 140;
    self.dataArray = [NSMutableArray arrayWithArray:@[@"observer事件",@"Block事件",@"MAIN_DISPATCH_QUEUE",@"Timer事件",@"Source0事件",@"Source1事件"]];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    RunloopCustomCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellID" forIndexPath:indexPath];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    SecViewController *sec = [SecViewController loadFromStoryBoard];
    [self.navigationController pushViewController:sec animated:YES];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [super touchesBegan:touches withEvent:event];
//    [self.view setNeedsLayout];
}


@end
