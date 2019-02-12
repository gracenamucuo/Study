//
//  ViewController.m
//  内存
//
//  Created by 戴运鹏 on 2019/2/12.
//  Copyright © 2019 戴运鹏. All rights reserved.
//

#import "ViewController.h"
#import "Model.h"
#import <objc/runtime.h>
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self testMethod];

}

- (void)testMethod
{
    Model *m = [[Model alloc]init];
    if ([m respondsToSelector:@selector(testInstanceMethod)]) {
        NSLog(@"对象方法");
    }
    if ([Model instancesRespondToSelector:@selector(testInstanceMethod)]) {
        [Model testClassMethod];
        NSLog(@"类方法");
    }
}

- (void)testInstance
{
    Model *m = [[Model alloc]init];
    Class cls0 = object_getClass(m);//这个方法相当于调用的isa
    Class cls1 = [m class];
    Class cls2 = [Model class];
    NSLog(@"%p %p %p %p",cls0,cls1,cls2,object_getClass(cls2));
    NSLog(@"%d %d %d  %d",class_isMetaClass(cls0),class_isMetaClass(cls1),class_isMetaClass(cls2),class_isMetaClass(object_getClass(cls2)));
    
}

- (void)testAutoReleasepool1{
    for (int i = 0; i < UINTMAX_MAX; i++) {
//        @autoreleasepool {
        NSString *str = [NSString stringWithFormat:@"%d",i];
            Model *m = [Model new];
            m.age = i;
//        }
        
        
    }
    NSLog(@"结束1");
}

- (void)testAutoReleasepool2{
    for (int i = 0; i < 10e5 * 2; i++) {
        NSString *str = [NSString stringWithFormat:@"%d",i];
        Model *m = [Model new];
        m.age = i;
    }
    NSLog(@"结束2");
}
@end
