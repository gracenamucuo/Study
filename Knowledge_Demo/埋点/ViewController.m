//
//  ViewController.m
//  埋点
//
//  Created by 戴运鹏 on 2019/2/14.
//  Copyright © 2019 戴运鹏. All rights reserved.
//

#import "ViewController.h"
#import "YYModel/YYModel.h"
#import "Model.h"
#import "NSArray+safe.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    NSString *jsonPath = [[NSBundle mainBundle] pathForResource:@"jj" ofType:@"json"];
    
//    NSString *json = [NSString stringWithContentsOfFile:jsonPath encoding:NSUTF8StringEncoding error:nil];
//    Model *model = [Model yy_modelWithJSON:json];
//    NSLog(@"%@",model.c);
    
//    NSLog(@"%lld",[model.b[@"test"] longLongValue]);
    
    NSMutableArray *arr = [NSMutableArray arrayWithArray:@[]];
    arr[0] = nil;
    [arr insertObject:@"8" atIndex:4];
    [arr insertObject:nil atIndex:0];
    
    
    
}

- (IBAction)shareBtnPressed:(UIButton *)sender {
    NSLog(@"主页分享");
}

- (IBAction)favBtnPressed:(UIButton *)sender {
    NSLog(@"主页点赞");
}
@end
