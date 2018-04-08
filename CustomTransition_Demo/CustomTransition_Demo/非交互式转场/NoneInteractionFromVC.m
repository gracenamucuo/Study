//
//  NoneInteractionFromVC.m
//  CustomTransition_Demo
//
//  Created by 戴运鹏 on 2018/4/5.
//  Copyright © 2018年 戴运鹏. All rights reserved.
//

#import "NoneInteractionFromVC.h"
#import "UIViewController+LoadController.h"
#import "NonInteractionToVC.h"
@interface NoneInteractionFromVC ()<UIViewControllerTransitioningDelegate,UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic,strong)NSMutableArray *dataSource;
@property (nonatomic,strong)NSMutableArray *dataArray;
@end

/*
 转场代理：遵守UIViewControllerTransitioningDelegate的对象
 
    //返回遵守UIViewControllerAnimatedTransitioning协议的动画控制器 为Present动画提供
    - (nullable id <UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source;
    //返回遵守UIViewControllerAnimatedTransitioning协议的动画控制器 为Dismiss动画提供
    - (nullable id <UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed;
 
    //返回遵守UIViewControllerInteractiveTransitioning协议的交互控制器  交互转场动画时实现  为Present动画提供
    - (nullable id <UIViewControllerInteractiveTransitioning>)interactionControllerForPresentation:(id <UIViewControllerAnimatedTransitioning>)animator;
    //返回遵守UIViewControllerInteractiveTransitioning协议的交互控制器  交互转场动画时实现  为Dismiss动画提供
    - (nullable id <UIViewControllerInteractiveTransitioning>)interactionControllerForDismissal:(id <UIViewControllerAnimatedTransitioning>)animator;
 
    - (nullable UIPresentationController *)presentationControllerForPresentedViewController:(UIViewController *)presented presentingViewController:(nullable UIViewController *)presenting sourceViewController:(UIViewController *)source NS_AVAILABLE_IOS(8_0);
 
 */

static NSString *cellID = @"cellID";
@implementation NoneInteractionFromVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:cellID];
    self.dataSource = [NSMutableArray array];
    [self.dataSource addObjectsFromArray:@[@"UIModalPresentationFullScreen",@"UIModalPresentationPageSheet",@"UIModalPresentationFormSheet",@"UIModalPresentationCurrentContext",@"UIModalPresentationCustom",@"UIModalPresentationOverFullScreen",@"UIModalPresentationOverCurrentContext",@"UIModalPresentationPopover",@"UIModalPresentationBlurOverFullScreen",@"UIModalPresentationNone"]];
    self.dataArray = [NSMutableArray array];
    [self.dataArray addObjectsFromArray:@[@"UIModalTransitionStyleCoverVertical",@"UIModalTransitionStyleFlipHorizontal",@"UIModalTransitionStyleCrossDissolve",@"UIModalTransitionStylePartialCurl"]];
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
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    NonInteractionToVC *toVC = [NonInteractionToVC loadFromMainStoryboard];
    toVC.modalTransitionStyle = indexPath.row;
  [self presentViewController:toVC animated:YES completion:nil];
    
}

- (IBAction)skipAction:(UIButton *)sender {
    
    
    /*
     typedef NS_ENUM(NSInteger, UIModalTransitionStyle) {
     UIModalTransitionStyleCoverVertical = 0,
     UIModalTransitionStyleFlipHorizontal __TVOS_PROHIBITED,
     UIModalTransitionStyleCrossDissolve,
     UIModalTransitionStylePartialCurl NS_ENUM_AVAILABLE_IOS(3_2) __TVOS_PROHIBITED,
     };
     */
    
    /*
     typedef NS_ENUM(NSInteger, UIModalPresentationStyle) {
     
     UIModalPresentationFullScreen = 0,
     
     
     UIModalPresentationPageSheet NS_ENUM_AVAILABLE_IOS(3_2) __TVOS_PROHIBITED,
     UIModalPresentationFormSheet NS_ENUM_AVAILABLE_IOS(3_2) __TVOS_PROHIBITED,
     UIModalPresentationCurrentContext NS_ENUM_AVAILABLE_IOS(3_2),
     
     UIModalPresentationCustom NS_ENUM_AVAILABLE_IOS(7_0),
     
     
     UIModalPresentationOverFullScreen NS_ENUM_AVAILABLE_IOS(8_0),
     UIModalPresentationOverCurrentContext NS_ENUM_AVAILABLE_IOS(8_0),
     UIModalPresentationPopover NS_ENUM_AVAILABLE_IOS(8_0) __TVOS_PROHIBITED,
     UIModalPresentationBlurOverFullScreen __TVOS_AVAILABLE(11_0) __IOS_PROHIBITED __WATCHOS_PROHIBITED,
     UIModalPresentationNone NS_ENUM_AVAILABLE_IOS(7_0) = -1,
     };
     */
//    self.modalPresentationStyle = UIModalPresentationFullScreen;

     
}



@end







