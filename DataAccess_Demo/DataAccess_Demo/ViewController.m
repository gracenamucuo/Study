//
//  ViewController.m
//  DataAccess_Demo
//
//  Created by 戴运鹏 on 2018/6/22.
//  Copyright © 2018年 戴运鹏. All rights reserved.
//

#import "ViewController.h"
#import "Person.h"
#import "ETSafeAccessHelper.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    ETSafeAccessHelper *helper1 = [[ETSafeAccessHelper alloc]initWithEnv:@"qa1" user_ID:@"A"];
    [helper1 setObject:@"字符串" forKey:@"A"];
    [helper1 setObject:@[@23,@{@"21":@"你好"}] forKey:@"B"];
    Person *p = [[Person alloc]init];
    p.name = @"你好";
    p.age = @"124";
    NSLog(@"%d",[p conformsToProtocol:@protocol(NSCoding)]);
    [helper1 setObject:p forKey:@"p"];
    
    CFMutableDictionaryRef _dic;
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [super touchesBegan:touches withEvent:event];
    ETSafeAccessHelper *helper1 = [[ETSafeAccessHelper alloc]initWithEnv:@"qa1" user_ID:@"B"];
    [helper1 setObject:@"字符串" forKey:@"A"];
    [helper1 setObject:@[@23,@{@"21":@"你好"}] forKey:@"B"];
}


@end
