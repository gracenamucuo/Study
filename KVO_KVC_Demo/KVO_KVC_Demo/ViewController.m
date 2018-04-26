//
//  ViewController.m
//  KVO_KVC_Demo
//
//  Created by 戴运鹏 on 2018/4/23.
//  Copyright © 2018年 戴运鹏. All rights reserved.
//

#import "ViewController.h"
#import "Person.h"
@interface ViewController ()

@end
static NSInteger const crashContext;
@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self crashCauseOfNotRemoveObserver];
}


///不移除观察者的崩溃问题
- (void)crashCauseOfNotRemoveObserver
{
    Person *person = [[Person alloc]init];
    person.name = @"前";
    [person addObserver:self forKeyPath:@"name" options:NSKeyValueObservingOptionOld|NSKeyValueObservingOptionNew context:nil];
    person.name = @"后";
    
}

///KVO的原理
- (void)testMethod
{
    Person *p1 = [[Person alloc]init];
    Person *p2 = [[Person alloc]init];
    p2.name = @"2前";
    p1.name = @"观察前";
    NSLog(@"%s--前-%s",object_getClassName(p1),object_getClassName(p2));
    //2018-04-23 13:35:44.519294+0800 KVO_KVC_Demo[19411:270752] Person--前-Person
    
    [p1 addObserver:self forKeyPath:@"name" options:NSKeyValueObservingOptionNew context:nil];
    p1.name = @"观察后";
    p2.name = @"2后";
    NSLog(@"%s--后-%s",object_getClassName(p1),object_getClassName(p2));
    //2018-04-23 13:35:44.519779+0800 KVO_KVC_Demo[19411:270752] NSKVONotifying_Person--后-Person
    //p1的属性增加观察者后，runtime自动生成了一个新的NSKVONotifying_Person类。p1的isa指针不再指向Person类，变为指向NSKVONotifying_Person类。
    
    [p1 removeObserver:self forKeyPath:@"name"];
    p1.name = @"去除观察者后";
    p2.name = @"去除后";
    NSLog(@"%s--去除-%s",object_getClassName(p1),object_getClassName(p2));
    //2018-04-23 13:35:44.519880+0800 KVO_KVC_Demo[19411:270752] Person--去除-Person
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context
{

    if ([keyPath isEqualToString:@"name"] && [object isKindOfClass:[Person class ]]) {
        NSLog(@"观察到了变化");
    }
}

















@end





