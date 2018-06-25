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
#import "Food.h"
#import "Son.h"
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
    Food *f = [[Food alloc]init];
    f.name = @"APPle";
    p.food = f;
    Son *s = [[Son alloc]init];
    s.fav = @"meat";
    s.name = @"儿子";
    s.age = @"男男女女";
    s.f = 22.3;
    s.food = f;
    [helper1 setObject:p forKey:@"p"];
    [helper1 setObject:s forKey:@"s"];
    [helper1 setObject:f forKey:@"f"];
    
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [super touchesBegan:touches withEvent:event];
    ETSafeAccessHelper *helper1 = [[ETSafeAccessHelper alloc]initWithEnv:@"qa1" user_ID:@"B"];
    [helper1 setObject:@"字符串" forKey:@"A"];
    [helper1 setObject:@[@23,@{@"21":@"你好"}] forKey:@"B"];
}


@end
