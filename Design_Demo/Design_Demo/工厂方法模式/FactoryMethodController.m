//
//  FactoryMethodController.m
//  Design_Demo
//
//  Created by 戴运鹏 on 2018/5/16.
//  Copyright © 2018年 戴运鹏. All rights reserved.
//

#import "FactoryMethodController.h"
#import "FactoryAdd.h"
#import "FactoryMinus.h"
#import "FactoryMultiply.h"
#import "FactoryDivide.h"
#import "CalculateMethodProtocol.h"
#import "FactoryMethodProtocol.h"
@interface FactoryMethodController ()
@property (weak, nonatomic) IBOutlet UITextField *numA;
@property (weak, nonatomic) IBOutlet UITextField *numB;

@property (weak, nonatomic) IBOutlet UILabel *result;
@end

@implementation FactoryMethodController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (IBAction)calculateAction:(UIButton *)sender {
    id<CalculateMethodProtocol> calculate;
    [[UIApplication sharedApplication].keyWindow endEditing:YES];
    switch (sender.tag) {
        case 11:
        {
            calculate = [FactoryAdd factoryMethodForCalculate];
        }
            break;
        case 12:
        {
            calculate = [FactoryMinus factoryMethodForCalculate];
        }
            break;
        case 13:
        {
            calculate = [FactoryMultiply factoryMethodForCalculate];
        }
            break;
        case 14:
        {
            calculate = [FactoryDivide factoryMethodForCalculate];
        }
            break;
        default:
            break;
    }
    calculate.numberA = [self.numA.text floatValue];
    calculate.numberB = [self.numB.text floatValue];
    CGFloat res = [calculate calculate];
    self.result.text = [NSString stringWithFormat:@"结果是:%f",res];
    
}

@end



