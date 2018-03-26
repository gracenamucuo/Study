//
//  ViewController.m
//  Runtime_Demo
//
//  Created by 戴运鹏 on 2018/3/22.
//  Copyright © 2018年 戴运鹏. All rights reserved.
//

#import "ViewController.h"
#import <objc/runtime.h>
#import "Person.h"
#import "A.h"
//#import "UIViewController+Swizzling.h"
#import "NSArray+Swizzling.h"
#import "Son.h"
//#import "NSObject+Sark.h"
#import "Animal.h"
#import "Student.h"
#import "MySubClass.h"
#import "MySubClass+Swizzling.h"
#import "SonAClass.h"
@interface ViewController ()

@end

NSString* personMethod(NSString *str){
    NSLog(@"----添加方法-----");
    return @"试一下返回";
}

void speak(){
  NSLog(@"----说话-----");
}

static NSArray * ClassMethodsNames(Class c)
{
    NSMutableArray *array = [NSMutableArray array];
    unsigned int methodCount = 0;
    Method *methodList = class_copyMethodList(c, &methodCount);
    unsigned int i;
    for (i = 0; i < methodCount; i++) {
        [array addObject:NSStringFromSelector(method_getName(methodList[i]))];
    }
    free(methodList);
    return array;
}

@implementation ViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self testMsgForward];
}

- (void)testMsgForward
{
    SonAClass *sonA = [[SonAClass alloc]init];
    [sonA dynamicBindMethod];
//    [SonAClass dynamicBindClassMethod];
}

- (void)testSwizzledAgain
{
    MySubClass *mysub = [[MySubClass alloc]init];
//    [mysub superMethod];
}

- (void)testIvar
{
    Student *stu = [[Student alloc]init];
    Ivar age_ivar = class_getInstanceVariable([Student class], "age");
    int *age_pointer = (int*)((__bridge void*)stu) + ivar_getOffset(age_ivar);
    NSLog(@"age ivar offset = %td",ivar_getOffset(age_ivar));
//    *age_pointer = 100;
    NSLog(@"%@",stu);
    
                              
}



- (void)testCategory
{
//    [NSObject foo];
//    [[NSObject new] foo];
    
//    SEL sel = @selector(foo);
//    NSLog(@"%s",(char *)sel);
//    NSLog(@"%p",sel);
//    const char *selName = [@"foo" UTF8String];
//    SEL sel2 = sel_registerName(selName);
//    NSLog(@"%s",(char*)sel2);
//    NSLog(@"%p",sel2);
    
    
    
    [[[Person alloc]init]speak];
    [[[Animal alloc]init]speak];
    [Person speak];
    [Animal speak];
  
    [[[Person alloc]init] performSelector:@selector(testCategory)];
    
    //测试category到底能否添加成员变量
    unsigned int count = 0;
    Ivar *ivars = class_copyIvarList([Person class], &count);
    Person *p = [[Person alloc]init];
    NSLog(@"%p",p);
    for (int i = 0; i < count; i++) {
        Ivar ivar = ivars[i];
        NSLog(@"%@",[NSString stringWithUTF8String:ivar_getName(ivar)]);
        ptrdiff_t off = ivar_getOffset(ivar);
        NSLog(@"%td",off);
    }
    free(ivars);
}


- (void)KVOTest
{
    Person *p = [[Person alloc]init];      //前: (lldb) p p->isa
                                            //(Class) $2 = Person
    
//    NSLog(@"self->isa:%@",objc_getClass(p));
    
    [p addObserver:self forKeyPath:@"name" options:NSKeyValueObservingOptionNew context:nil];
    //后:(lldb) p p->isa
    //(Class) $3 = NSKVONotifying_Person
    
    /*
     KVO在调用addObserver方法之后，苹果的做法是在执行完addObserver: forKeyPath: options: context: 方法之后，把isa指向到另外一个类去。
     在这个新类里面重写被观察的对象四个方法。class，setter，dealloc，_isKVOA。
     */
}

//一些问题
- (void)test

{
        BOOL res1 = [(id)[NSObject class] isKindOfClass:[NSObject class]];
        BOOL res2 = [(id)[NSObject class] isMemberOfClass:[NSObject class]];
    
        BOOL res3 = [(id)[Person class] isKindOfClass:[Person class]];
        BOOL res4 = [(id)[Person class] isMemberOfClass:[Person class]];
        NSLog(@"%d %d %d %d",res1,res2,res3,res4);
    Class cls;
    cls = [NSObject class];
    
    
    Person *personInstance = [[Person alloc]init];
    Son *sonInstance = [[Son alloc]init];
    
    
    
    
    NSLog(@"%@",objc_getClass("sonInstance"));
    
    NSLog(@"%p",cls);
    
    //
    
    //    id cls = [Person class];
    //    void *obj = &cls;
    //    [(__bridge id)obj speak];
}
//验证方法几个方法
- (void)test1
{
    [[[Person alloc]init]speak];
//      BOOL res = class_addMethod([Person class], @selector(personMethod), (IMP)personMethod, "@:@");
//    // //当Person这个类里没有personMethod方法时，res为1，说明personMethod这个方法添加到了Person这个类里。
////        BOOL res1 = class_addMethod([Person class], @selector(speak), (IMP)speak, "@:");
//     // //当Person这个类里有speak方法声明时，但没有实现时，res1返回1，说明添加了这个方法的实现，但是如果speak有实现的时候，res1返回0，说明没有添加成功。
//
////    NSLog(@"%d---%d",res,res1);
////    NSString *returnStr =(NSString *)[[[Person alloc]init]performSelector:@selector(personMethod)];
////    [[[Person alloc]init]performSelector:@selector(speak)];
//
//
//    SEL originalSel = @selector(speak);
//    SEL swizzledSel = @selector(personMethod);
//    Method oM = class_getInstanceMethod([Person class], originalSel);
//    Method sM = class_getInstanceMethod([Person class], swizzledSel);
//    BOOL didAdd = class_addMethod([Person class], originalSel, method_getImplementation(sM), method_getTypeEncoding(sM));
//    Person *personInstance = [[Person alloc]init];
////    [personInstance speak];//现在运行结果是personMethod的实现。
//    [personInstance performSelector:@selector(personMethod) withObject:@""];
//    method_setImplementation(oM, method_getImplementation(sM));
//
//    NSLog(@"%s",method_getImplementation(sM),method_getImplementation(oM));
//    class_replaceMethod([Person class], swizzledSel, method_getImplementation(oM), method_getTypeEncoding(oM));
//    [personInstance speak];
//    [personInstance performSelector:@selector(personMethod) withObject:@""];
//    //
//

}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    NSLog(@"------++++-----我是真的");
}

- (void)personMethod
{
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

















































