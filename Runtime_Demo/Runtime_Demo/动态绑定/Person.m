//
//  Person.m
//  Runtime_Demo
//
//  Created by 戴运鹏 on 2018/3/22.
//  Copyright © 2018年 戴运鹏. All rights reserved.
//

#import "Person.h"

@implementation Person

//- (void)speak
//{
////    NSLog(@"my name is %@",self.name);
//    SEL sel = @selector(speak);
//    NSLog(@"Person  %s----%p",(char *)sel,sel);
//}
+ (void)speak
{
    SEL sel = @selector(speak);
    NSLog(@"Person  %s----%p",(char *)sel,sel);
}
@end












