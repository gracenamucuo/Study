//
//  ViewController.m
//  埋点
//
//  Created by 戴运鹏 on 2019/2/14.
//  Copyright © 2019 戴运鹏. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)shareBtnPressed:(UIButton *)sender {
    NSLog(@"主页分享");
}

- (IBAction)favBtnPressed:(UIButton *)sender {
    NSLog(@"主页点赞");
}
@end
