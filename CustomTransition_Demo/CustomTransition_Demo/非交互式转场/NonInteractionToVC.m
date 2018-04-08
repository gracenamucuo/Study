//
//  NonInteractionToVC.m
//  CustomTransition_Demo
//
//  Created by 戴运鹏 on 2018/4/5.
//  Copyright © 2018年 戴运鹏. All rights reserved.
//

#import "NonInteractionToVC.h"

@interface NonInteractionToVC ()

@end

@implementation NonInteractionToVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}


- (IBAction)dismissAction:(UIButton *)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
    
}


@end
