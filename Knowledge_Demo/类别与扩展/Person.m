//
//  Person.m
//  类别与扩展
//
//  Created by 戴运鹏 on 2019/1/25.
//  Copyright © 2019 戴运鹏. All rights reserved.
//

#import "Person.h"
//#import "Person+TestExtension.h"
@interface Person ()
- (void)test;//匿名类别中的方法如果没有实现的话，会报警告，是因为匿名类别是在编译期添加到类中的，而类别中声明的方法如果没有实现的话，是不会报警告的，因为类别是在运行时添加到类中的。
@end

@implementation Person

- (void)testExtensionMethod{
    NSLog(@"extension中声明的方法的实现");
}
@end
