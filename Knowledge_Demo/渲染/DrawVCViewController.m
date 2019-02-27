//
//  DrawVCViewController.m
//  渲染
//
//  Created by 戴运鹏 on 2019/2/27.
//  Copyright © 2019 戴运鹏. All rights reserved.
//

#import "DrawVCViewController.h"
#import "DrawView.h"
#import "NSObject+RunloopObesever.h"

@interface DrawVCViewController ()

@end

@implementation DrawVCViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    DrawView *draw = [[DrawView alloc]initWithFrame:CGRectMake(100, 100, 50, 50)];
//    draw.backgroundColor = [UIColor redColor];
    [self.view addSubview:draw];
    
   
    
    
    [self performSelector:@selector(addObserver)];
}

@end
