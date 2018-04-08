//
//  PresentedController.m
//  CustomTransition_Demo
//
//  Created by 戴运鹏 on 2018/4/8.
//  Copyright © 2018年 戴运鹏. All rights reserved.
//

#import "PresentedController.h"

@interface PresentedController ()

@end

@implementation PresentedController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.layer.cornerRadius  = 20.f;
}




- (IBAction)dismissAction:(UIButton *)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
