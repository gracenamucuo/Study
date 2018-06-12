//
//  ViewController.m
//  Performance_Demo
//
//  Created by 戴运鹏 on 2018/6/12.
//  Copyright © 2018年 戴运鹏. All rights reserved.
//

#import "ViewController.h"
#import "BackDestoryView.h"
#import "BackDestoryModel.h"
@interface ViewController ()
@property (nonatomic,strong)BackDestoryView *destoryView;
@property (nonatomic,strong)BackDestoryModel *destoryModel;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.destoryView = [[BackDestoryView alloc]initWithFrame:CGRectMake(30, 100, 100, 100)];
    self.destoryView.backgroundColor = [UIColor redColor];
    [self.view addSubview:self.destoryView];
    
    self.destoryModel = [[BackDestoryModel alloc]init];
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [super touchesBegan:touches withEvent:event];
//    [self.destoryView removeFromSuperview];
    
//    UIView *temp = self.destoryView;
   
//    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
//        [temp class];
//    });
//     self.destoryView = nil;
    
    //对于非控件类的对象可以被捕获到block中，在后台销毁，但是对于控件类的对象不适用。
    BackDestoryModel *back = self.destoryModel;
    self.destoryModel = nil;
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        [back class];
    });
}


@end
