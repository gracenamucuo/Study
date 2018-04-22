 //
//  SonClass.m
//  Load_Initialize_Demo
//
//  Created by 戴运鹏 on 2018/4/22.
//  Copyright © 2018年 戴运鹏. All rights reserved.
//

#import "SonClass.h"

@implementation SonClass

- (instancetype)init
{
    self = [super init];
    if (self) {
        _sonName =@"子类赋值";
    }
    return self;
}


- (void)setName:(NSString *)name
{
    NSLog(@"%@----开始",self.sonName);//子类重写了父类的setter方法，在父类的init方法中调用了setter方法，在初始化子类的时候，父类init中setter方法走的是子类重写的setter方法，此时，子类中的init方法还没有执行，即子类还没有初始化完成，就调用子类的方法，会出现未知的bug。
}

- (void)dealloc
{
    _sonName = nil;
}

@end
