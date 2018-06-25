//
//  ViewController.m
//  Layout_Demo
//
//  Created by 戴运鹏 on 2018/6/24.
//  Copyright © 2018年 戴运鹏. All rights reserved.
//

#import "ViewController.h"
#import "Masonry.h"
#import "ETViewLayout.h"
#import "UIView+Layout.h"
#import "SecondController.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIView *redView = [[UIView alloc]init];
    redView.backgroundColor = [UIColor redColor];
    [self.view addSubview:redView];
    
    ETViewLayout *redLayout = [[ETViewLayout alloc]init];
    redLayout.left(self.view,NSLayoutAttributeLeft,160).top(self.view,NSLayoutAttributeTop,100).width(redView,NSLayoutAttributeWidth,50).height(redView, NSLayoutAttributeHeight, 150).leading(self.view, NSLayoutAttributeLeading, 100);
    [redView makeLayout:redLayout];
    
    
    
    
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [super touchesBegan:touches withEvent:event];
    SecondController *sec = [[SecondController alloc]init];
    [self.navigationController pushViewController:sec animated:YES];
}




@end








