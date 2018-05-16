//
//  SimpleFactoryPatternController.m
//  Design_Demo
//
//  Created by 戴运鹏 on 2018/5/16.
//  Copyright © 2018年 戴运鹏. All rights reserved.
//

#import "SimpleFactoryPatternController.h"
#import "CalcluateFactory.h"
@interface SimpleFactoryPatternController ()
@property (weak, nonatomic) IBOutlet UITextField *numA;
@property (weak, nonatomic) IBOutlet UITextField *operator;
@property (weak, nonatomic) IBOutlet UITextField *numB;
@property (weak, nonatomic) IBOutlet UILabel *resultLabel;

@end

@implementation SimpleFactoryPatternController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)calculate:(UIButton *)sender {
    [[UIApplication sharedApplication].keyWindow endEditing:YES];
    
    id<CaculateProtocol> calculate = [CalcluateFactory createCalculate:self.operator.text];
    calculate.numberA = [self.numA.text floatValue];
    calculate.numberB = [self.numB.text floatValue];
    CGFloat reslult = [calculate calculate];
    self.resultLabel.text = [NSString stringWithFormat:@"结果是:%@",[@(reslult) stringValue]];
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
