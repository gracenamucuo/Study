//
//  ViewController.m
//  事件传递和响应者链
//
//  Created by 戴运鹏 on 2018/8/18.
//  Copyright © 2018年 戴运鹏. All rights reserved.
//

#import "ViewController.h"
#import "AView.h"
#import "BView.h"
#import "CBtn.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    AView *a = [[AView alloc]initWithFrame:self.view.bounds];
    a.backgroundColor = [UIColor redColor];
    [self.view addSubview:a];
    
    BView *b = [[BView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height / 2)];
    b.backgroundColor = [UIColor greenColor];
    [a addSubview:b];
    CBtn *c = [CBtn buttonWithType:UIButtonTypeCustom];
    c.frame = CGRectMake(0, 0, 50, 50);
    [b addSubview:c];
    [c setTitle:@"点击" forState:UIControlStateNormal];
    [c setBackgroundColor:[UIColor blueColor]];
//    [c addTarget:self action:@selector(tapAction) forControlEvents:UIControlEventTouchUpInside];
    
}
- (void)tapAction
{
    NSLog(@"点击");
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
