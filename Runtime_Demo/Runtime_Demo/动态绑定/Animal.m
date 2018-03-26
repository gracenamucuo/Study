//
//  Animal.m
//  Runtime_Demo
//
//  Created by 戴运鹏 on 2018/3/25.
//  Copyright © 2018年 戴运鹏. All rights reserved.
//

#import "Animal.h"

@implementation Animal
- (void)speak
{
    SEL sel = @selector(speak);
    NSLog(@"Animal  %s----%p",(char*)sel,sel);
}

+ (void)speak
{
    SEL sel = @selector(speak);
    NSLog(@"Person  %s----%p",(char *)sel,sel);
}
@end
