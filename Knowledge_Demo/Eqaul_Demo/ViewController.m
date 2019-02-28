//
//  ViewController.m
//  Eqaul_Demo
//
//  Created by 戴运鹏 on 2019/2/28.
//  Copyright © 2019 戴运鹏. All rights reserved.
//

#import "ViewController.h"
#import "EqualModel.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self testSet];
//    [self testDictionary];
    
}

- (void)testSet
{
    NSMutableSet *set = [NSMutableSet set];
    
    EqualModel *model0 = [[EqualModel alloc]init];
    model0.name = @"model0";
    model0.identifier = 0;
    NSLog(@"-------0--前");
//    [set addObject:model0];
    NSLog(@"-------0--后");
    
    EqualModel *model1 = [[EqualModel alloc]init];
    model1.name = @"model1";
    model1.identifier = 1;
    NSLog(@"-------1--前");
    [set addObject:model1];
    NSLog(@"-------1--后");
    
    EqualModel *model2 = [[EqualModel alloc]init];
    model2.name = @"model2";
    model2.identifier = 2;
//    [set addObject:model2];
    
//    for (NSInteger i = 0; i < 1000; i++) {
//        EqualModel *model = [[EqualModel alloc]init];
//        model.name = [NSString stringWithFormat:@"model%ld",(long)i];
//        model.identifier = i + 3;
//        [set addObject:model];
//    }
    
//    NSLog(@"判断有的元素----------");
//    NSLog(@"%d",[set containsObject:model1]);
//    NSLog(@"判断没有的元素----------");
    NSLog(@"%d",[set containsObject:model1]);
}

- (void)testDictionary
{
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    
    EqualModel *model0 = [[EqualModel alloc]init];
    model0.name = @"model0";
    model0.identifier = 0;
    
    EqualModel *model1 = [[EqualModel alloc]init];
    model1.name = @"model1";
    model1.identifier = 1;
    
    [dic setObject:model1 forKey:model0];
    [dic setObject:model0 forKey:model1];
    
    NSLog(@"%@",dic[model0]);
    
    
}

@end
