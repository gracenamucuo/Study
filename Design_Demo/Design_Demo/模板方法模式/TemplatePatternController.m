//
//  TemplatePatternController.m
//  Design_Demo
//
//  Created by 戴运鹏 on 2018/6/8.
//  Copyright © 2018年 戴运鹏. All rights reserved.
//

#import "TemplatePatternController.h"
#import "Tea.h"
#import "Coffee.h"
@interface TemplatePatternController ()

@end

@implementation TemplatePatternController

- (void)viewDidLoad {
    [super viewDidLoad];
    Tea *tea = [[Tea alloc]init];
    [tea prepareRecipe];
    
    Coffee *coffee = [[Coffee alloc]init];
    [coffee prepareRecipe];
}



@end
