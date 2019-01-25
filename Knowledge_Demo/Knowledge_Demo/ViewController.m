//
//  ViewController.m
//  Knowledge_Demo
//
//  Created by 戴运鹏 on 2019/1/24.
//  Copyright © 2019 戴运鹏. All rights reserved.
//

#import "ViewController.h"
#import "Person.h"
#import "WeakInstance.h"
#import "Person+WeakAssociated.h"
@interface ViewController ()
@property (nonatomic,strong)WeakInstance *instance;
@property (nonatomic,strong)Person *p;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self testCopyAndStrong];
}

- (void)testCopyAndStrong
{
    Person *p = [Person new];
    p.nameStr = @"12";
    NSLog(@"%p",p.nameStr);
    p.nameStr = @"233";
    NSLog(@"后 %p",p.nameStr);
    p.mutableStr = [NSMutableString stringWithString:@"活动的"];
    NSLog(@"活动前%p",p.mutableStr);
    [p.mutableStr appendString:@"加"];//这里可变对象用copy修饰的话，调用setter方法后，会copy成不可变动对象，这里就会崩溃
    NSLog(@"活动后%p",p.mutableStr);
}

- (void)testStackAndHeap{
    int a = 10;
    //线程中的栈是相互独立的 属于线程自己？？？
    Person *p = [Person new];
    NSLog(@"%p-----%@",&a,p);
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSLog(@"啊啊啊%p",&a);
        NSLog(@"啊啊啊%p-----%@----%p",&a,p,p);
        NSLog(@"%@",*(&p));
    });
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSLog(@"哈哈哈%p",&a);
        NSLog(@"哈哈哈%p-----%@---%p",&a,p,&p);
    });
}

- (void)testProperty{
    Person *p = [Person new];
    p.dynamicProperty = @"1";
}

- (void)weakAssociated{
    Person *p = [Person new];
    Son *son = [Son new];
    p.son = son;
    p.weakSon = son;
    self.p = p;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [super touchesBegan:touches withEvent:event];
    self.p.son = nil;
}

- (void)test{
    Person *p = [[Person alloc]init];
    p.sex = @"最初";
//    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
//        for (NSInteger i = 0; i < 100; i++) {
//            p.sex = @"1";
//            NSLog(@"线程1%@,值%@",[NSThread currentThread],p.sex);
//        }
//    });
//    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
//        for (NSInteger i = 0; i < 100; i++) {
//            p.sex = @"2";
//            NSLog(@"线程2%@,值%@",[NSThread currentThread],p.sex);
//        }
//    });
    p.arr = [NSMutableArray array];
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        
            [p.arr addObject:@1];
            [p.arr addObject:@2];
            [p.arr addObject:@3];
            NSLog(@"线程1%@,值%@",[NSThread currentThread],p.arr);

    });
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        
            NSLog(@"%@",p.arr[2]);
            
        
    });

}

@end
