//
//  ViewController.m
//  AutoLayout_Demo
//
//  Created by 戴运鹏 on 2018/4/25.
//  Copyright © 2018年 戴运鹏. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *label;
@property (weak, nonatomic) IBOutlet UIView *containerView;
@property (nonatomic,assign)CGFloat x;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.label.text = @"All rights reserved.";
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [super touchesBegan:touches withEvent:event];
 
         self.label.text =[NSString stringWithFormat:@"%@%@",self.label.text,@"All rights reserved."];
    NSLog(@"%f---%@",[self.containerView systemLayoutSizeFittingSize:UILayoutFittingExpandedSize].height,NSStringFromCGRect(self.containerView.frame));

}

@end
