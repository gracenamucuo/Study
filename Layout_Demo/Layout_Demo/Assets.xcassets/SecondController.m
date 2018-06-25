//
//  SecondController.m
//  Layout_Demo
//
//  Created by 戴运鹏 on 2018/6/25.
//  Copyright © 2018年 戴运鹏. All rights reserved.
//

#import "SecondController.h"
#import "ETViewLayout.h"
#import "UIView+Layout.h"
#import "Masonry.h"
@interface SecondController ()

@end

@implementation SecondController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor lightGrayColor];
    
    UIView *redView = [[UIView alloc]init];
    redView.backgroundColor = [UIColor redColor];
    [self.view addSubview:redView];
    [redView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.firstBaseline.equalTo(self.view);
//        make.lastBaseline.equalTo(self.view);
        make.width.mas_equalTo(200);
        make.leading.equalTo(self.view.mas_leading).offset(50);
        make.height.equalTo(@(250));
    }];
    
}

- (void)dealloc
{
    NSLog(@"%@ dealloc",[self class]);
}
    
    


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
