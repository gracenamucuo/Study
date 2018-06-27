//
//  ViewController.m
//  Model_Demo
//
//  Created by 戴运鹏 on 2018/6/27.
//  Copyright © 2018年 戴运鹏. All rights reserved.
//

#import "ViewController.h"
#import "ListModel.h"
#import "NSObject+ETModel.h"
#import "YYModel.h"
#import "UserModel.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    ListTotalModel *total = [ListTotalModel et_modelWithJSON:[[NSData alloc]initWithContentsOfFile:[[NSBundle mainBundle]pathForResource:@"list_json" ofType:@"json"]]];

    
    ListTotalModel *t = [[ListTotalModel alloc]init];
    [t et_modelSetWithJson:[[NSData alloc]initWithContentsOfFile:[[NSBundle mainBundle]pathForResource:@"list_json" ofType:@"json"]]];
    
    ListTotalModel *t2 = [[ListTotalModel alloc]init];
    [t2 et_modelSetWithDictionary: [self readLocalFileWithName:@"list_json"]];
    
    NSDictionary *dic = [NSDictionary et_modelDictionaryWithClass:[UserModel class] json:[self readLocalFileWithName:@"dic"]];
    NSLog(@"%@",dic);
    
}

- (id)readLocalFileWithName:(NSString *)fileName
{
    NSString *path = [[NSBundle mainBundle]pathForResource:fileName ofType:@"json"];
    NSData *data = [[NSData alloc]initWithContentsOfFile:path];
    return [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
}


@end
