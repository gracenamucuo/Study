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
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Person *p = [[Person alloc]init];
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
        
    }
    return 0;
}

