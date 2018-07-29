//
//  ViewController.m
//  Memory_Demo
//
//  Created by 戴运鹏 on 2018/7/29.
//  Copyright © 2018年 戴运鹏. All rights reserved.
//
/*
 内存泄漏情景
 OC对象循环引用
 OC对象被全局变量直接或者间接持有，忘记断开
 CF对象或者malloc的内存忘记手动释放
 */

/*
当向系统申请内存时，系统并不会给你返回物理内存的地址，而是给你一个虚拟内存地址。每个进程拥有相同大小的虚拟地址空间。对于32位的进程，可以拥有4GB的虚拟内存，64位进程则更多，可达18EB。只有我们开始使用申请到的虚拟内存时，系统才会将虚拟地址映射到物理地址上。从而让程序使用真实的物理地址。
 */

/*内存分页
 系统会对虚拟内存和物理内存进行分页，虚拟内存到物理内存的映射都是以页为最小粒度的。(基于A9处理器的系统，物理和虚拟内存都是以16KB进行分页)
 1，活跃内存页（active pages）- 这种内存页已经被映射到物理内存中，而且近期被访问过，处于活跃状态。
 
 2，非活跃内存页（inactive pages）- 这种内存页已经被映射到物理内存中，但是近期没有被访问过。
 
3，可用的内存页（free pages）- 没有关联到虚拟内存页的物理内存页集合。
 
 */
#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIView *red = [[UIView alloc]init];
    red.frame = self.view.bounds;
    red.backgroundColor = [UIColor redColor];
    [self.view addSubview:red];

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
