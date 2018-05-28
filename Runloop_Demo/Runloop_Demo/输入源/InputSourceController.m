//
//  InputSourceController.m
//  Runloop_Demo
//
//  Created by 戴运鹏 on 2018/5/26.
//  Copyright © 2018年 戴运鹏. All rights reserved.
//

#import "InputSourceController.h"
#define MACH_PORT_NAME "MACH_PORT_NAME"
@interface InputSourceController ()
@property (nonatomic,strong)NSRunLoop *childRunloop;
//@property (nonatomic,assign)CFRunLoopRef childRunloop;
@end

@implementation InputSourceController{
//    CFRunLoopRef _childRunloop;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [NSThread detachNewThreadSelector:@selector(createSource0) toTarget:self withObject:nil];
}


/**
 创建source0
 */
- (void)createSource0
{
    //上下文
    CFRunLoopSourceContext context ={ .version = 0, .info = (__bridge void*)self,.perform = performSource0};
    //sourcr0
    CFRunLoopSourceRef source0 = CFRunLoopSourceCreate(kCFAllocatorDefault, 0, &context);
    //将输入源添加到当前runloop的model中
    CFRunLoopAddSource(CFRunLoopGetCurrent(), source0, kCFRunLoopDefaultMode);
    //标记source0为待处理
    CFRunLoopSourceSignal(source0);
//    _childRunloop = CFRunLoopGetCurrent();
//    CFRunLoopWakeUp(CFRunLoopGetCurrent());
    
    self.childRunloop = [NSRunLoop currentRunLoop];
    [self.childRunloop run];//如果这里不将runloop跑起来，那就相当于没有循环,runloop是死的。
}

static void performSource0(void *info)
{
    NSLog(@"source0 callBack");
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [super touchesBegan:touches withEvent:event];
    
    //唤醒runloop。
    
    [self.childRunloop run];//再讲runloop跑起来，此时他的source0已经是非待处理状态了【在创建后，runloop直接run了后，就标记为非待处理状态了。】
}

//===============================================================


/**
 创建souece1
 */
- (void)createSource1
{
    //创建接收端口
    CFMessagePortRef localPort = CFMessagePortCreateLocal(kCFAllocatorDefault, CFSTR(MACH_PORT_NAME), CallBack, NULL, NULL);
    //创建端口输入源
    CFRunLoopSourceRef source = CFMessagePortCreateRunLoopSource(kCFAllocatorDefault, localPort, 0);
    //添加端口输入源
    CFRunLoopAddSource(CFRunLoopGetCurrent(), source, kCFRunLoopDefaultMode);
    //创建发送端口
    CFMessagePortRef remotePort = CFMessagePortCreateRemote(kCFAllocatorDefault, CFSTR(MACH_PORT_NAME));
    //发送消息
    CFMessagePortSendRequest(remotePort, kCFMessagePortSuccess, NULL, 0, 100, kCFRunLoopDefaultMode, NULL);
}

static CFDataRef CallBack(CFMessagePortRef local,SInt32 msgid,CFDataRef data,void *info){
    NSLog(@"This is a message");
    NSLog(@"%@",[NSThread currentThread]);
    return NULL;
}
@end


















































































