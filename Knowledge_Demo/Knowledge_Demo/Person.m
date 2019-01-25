//
//  Person.m
//  类别与扩展
//
//  Created by 戴运鹏 on 2019/1/25.
//  Copyright © 2019 戴运鹏. All rights reserved.
//

#import "Person.h"
//#import "Person+TestExtension.h"
@interface Person (){
    NSString *_dynamicProperty;
}
- (void)test;//匿名类别中的方法如果没有实现的话，会报警告，是因为匿名类别是在编译期添加到类中的，而类别中声明的方法如果没有实现的话，是不会报警告的，因为类别是在运行时添加到类中的。
@end



@implementation Person
@dynamic dynamicProperty;

//@synthesize nameStr = _nameStr;//也可以自动生成不别的成员变量的名字、
- (void)testExtensionMethod{
    NSLog(@"extension中声明的方法的实现");
}

- (void)setDynamicProperty:(NSString *)dynamicProperty
{
    //由于使用@dynamic，编译器不会自动生成变量，因此除此之外，还需要手动定义_dynamicProperty变量，如下：
    _dynamicProperty = dynamicProperty;
}

//- (void)setNameStr:(NSString *)nameStr
//{
//    _nameStr = nameStr;
//}

- (NSString *)nameStr
{
    NSLog(@"方法里%p",_nameStr);
    return _nameStr;//当重写了属性的setter和getter两个方法的时候，编译器会认为是自动合成的这个属性，其实例变量应该需要手动@synthesize nameStr = _nameStr;才会有。如果单写一个，就不会有这种问题。
}


@end
