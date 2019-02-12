//
//  main.m
//  类别与扩展
//
//  Created by 戴运鹏 on 2019/1/25.
//  Copyright © 2019 戴运鹏. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"
#import "Person+PropertyCategory.h"
#import "Person+TestExtension.h"
#import "Son.h"
#import "KVCModel.h"
#import "KVCClass.h"
#import "KVOClassA.h"
#import "KVOClassB.h"
#import "KVOClassC.h"
#import "KVOPerson.h"
#import "KVOObeserve.h"
void kvcTest(){
    KVCClass *obj = [[KVCClass alloc]init];
    obj.stringA = @"stringA setter";
    [obj setValue:@"stringA KVC" forKey:@"stringA"];//1
    [obj setValue:@"_stringA KVC" forKey:@"_stringA"];//2
    NSLog(@"stringA的值%@",obj.stringA);
    NSLog(@"------------------------------");
    
    [obj setValue:@"_modelString kvc" forKeyPath:@"modelA._modelString"];//3
    [obj setValue:@"modelString kvc" forKeyPath:@"modelA.modelString"];//4
    [obj setValue:@"__modelString kvc" forKeyPath:@"modelA.__modelString"];//5
    
    [obj setValue:@"noExist1" forKeyPath:@"modelA.noExist1"];//6
    NSLog(@"obj.modelA._modelSring值:%@",obj.modelA._modelString);
    NSLog(@"------------------------------");
    
    NSString *s1 = [obj valueForKeyPath:@"modelA._modelString"];//7
    NSString *s2 = [obj valueForKeyPath:@"modelA.modelString"];//8
    NSString *s3 = [obj valueForKeyPath:@"modelA.__modelString"];//9
    NSLog(@"1%@ 2%@ 3%@",s1,s2,s3);
    //1，3，4，6执行了setter方法，7,8执行了getter方法，2，5，9直接访问实例变量
    
}
void kvoTest(void);
void keoTestTriggerObeserve(void)
{
    KVOPerson *p = [[KVOPerson alloc]init];
    p.age = 10;
    
    KVOObeserve *obe = [KVOObeserve new];
    [p addObserver:obe forKeyPath:@"age" options:NSKeyValueObservingOptionNew|NSKeyValueObservingOptionOld context:nil];
    p.age = 99;
    
}
int main(int argc, const char * argv[]) {
    @autoreleasepool {
//        Person *p = [[Person alloc]init];
//        p.nameWithRuntime = @"124";
//
//        NSLog(@"%@====%@",p.nameWithRuntime);
//        //=============
//        p.nameNoRuntime = @"1";
//        NSLog(@"%@",p.nameNoRuntime);
        
        
        
        
//        p.name = @"extension中的属性";//extension中的声明的属性和方法，如果没有在类文件中引用的话，在外部调用，会崩溃。
//        NSLog(@"%@",p.name);
//        [p testExtensionMethod];
        

   //
//        Son *s = [Son new];
//        p.associateSon = s;
//        NSLog(@"关联");
//        sleep(5);
////        p = nil;
//        NSLog(@"置空");
        
        //KVC
//        kvcTest();
        //KVO
//        kvoTest();
        //KVOTest触发观察者
        keoTestTriggerObeserve();
    }
    return 0;
}

NSArray <NSString *> * getProperties(Class aClass){
    unsigned int count;
    objc_property_t *properties = class_copyPropertyList(aClass, &count);
    NSMutableArray *mArray = [NSMutableArray array];
    for (int i = 0; i < count; i++) {
        objc_property_t property = properties[i];
        const char *cName = property_getName(property);
        NSString *name = [NSString stringWithCString:cName encoding:NSUTF8StringEncoding];
        [mArray addObject:name];
    }
    return mArray.copy;
}

NSArray<NSString *> *getIvars(Class aClass) {
    unsigned int count;
    Ivar *ivars = class_copyIvarList(aClass, &count);
    NSMutableArray *mArray = [NSMutableArray array];
    for (int i = 0; i < count; i++) {
        Ivar ivar = ivars[i];
        const char *cName = ivar_getName(ivar);
        NSString *name = [NSString stringWithCString:cName encoding:NSUTF8StringEncoding];
        [mArray addObject:name];
    }
    return mArray.copy;
}

NSArray<NSString *> *getMethods(Class aClass) {
    unsigned int count;
    Method *methods = class_copyMethodList(aClass, &count);
    NSMutableArray *mArray = [NSMutableArray array];
    for (int i = 0; i < count; i++) {
        Method method = methods[i];
        SEL selector = method_getName(method);
        NSString *selectorName = NSStringFromSelector(selector);
        [mArray addObject:selectorName];
    }
    return mArray.copy;
}
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wunused-variable"
void kvoTest(){
    KVOClassA *objectA = [[KVOClassA alloc] init];
    KVOClassB *objectB = [[KVOClassB alloc] init];
    KVOClassC *objectC = [[KVOClassC alloc] init];
    NSString *bbb = objectB.classssss;
    //objectB.classssss = @"";
    
    Class classA1 = object_getClass(objectA);
    Class classA1C = [objectA class]; // objectA.class;
    NSLog(@"before objectA: %@", classA1);
    NSArray *propertiesA1 = getProperties(classA1);
    NSArray *ivarsA1 = getIvars(classA1);
    NSArray *methodsA1 = getMethods(classA1);
    IMP setterA1IMP = objectA.imp;
    IMP classA1IMP = objectA.classImp;
    
    Class classB1 = object_getClass(objectB);
    NSLog(@"before objectA: %@", classB1);
    NSArray *propertiesB1 = getProperties(classB1);
    NSArray *ivarsB1 = getIvars(classB1);
    NSArray *methodsB1 = getMethods(classB1);
    
//    [objectA addObserver:objectB forKeyPath:@"value" options:NSKeyValueObservingOptionOld|NSKeyValueObservingOptionNew context:nil];
    [objectA addObserver:objectC forKeyPath:@"value" options:NSKeyValueObservingOptionOld|NSKeyValueObservingOptionNew context:nil];
        [objectA addObserver:objectB forKeyPath:@"value" options:NSKeyValueObservingOptionOld|NSKeyValueObservingOptionNew context:nil];//最后添加的观察者先接收到变化。
    
    Class classA2 = object_getClass(objectA);//与objectA->isa方法等价 用该方法得到的class类型不一定准确，当该对象被观察后就不对了
    Class classA2C = [objectA class];//该方法获得的class类型一直准确
    BOOL isSame = [objectA isEqual:[objectA self]];
    id xxxx = [[classA2 alloc] init];
    NSLog(@"after objectA: %@", classA2);
    NSArray *propertiesA2 = getProperties(classA2);
    NSArray *ivarsA2 = getIvars(classA2);
    NSArray *methodsA2 = getMethods(classA2);
    IMP setterA2IMP = objectA.imp;
    IMP classA2IMP = objectA.classImp;
    
    Class classB2 = object_getClass(objectB);
    NSLog(@"before objectA: %@", classB2);
    NSArray *propertiesB2 = getProperties(classB2);
    NSArray *ivarsB2 = getIvars(classB2);
    NSArray *methodsB2 = getMethods(classB2);
    
    NSObject *object = [[NSObject alloc] init];
    NSArray *propertiesObj = getProperties([object class]);
    NSArray *methodsObj = getMethods([object class]);
    NSArray *ivarsObj = getIvars([object class]);
    
    BOOL isSameClass = [classA1 isEqual:classA2];
    BOOL isSubClass = [classA2 isSubclassOfClass:classA1];
    
    objectA.value = 10;
    [objectA removeObserver:objectB forKeyPath:@"value"];
    [objectA removeObserver:objectC forKeyPath:@"value"];
    
    NSNumber *integerNumber = [NSNumber numberWithInteger:1];
    Class integerNumberClass = object_getClass(integerNumber);
    NSNumber *boolNumber = [NSNumber numberWithBool:YES];
    Class boolNumberClass = object_getClass(boolNumber);
    NSLog(@"kvo test");
}
#pragma clang diagnostic pop
