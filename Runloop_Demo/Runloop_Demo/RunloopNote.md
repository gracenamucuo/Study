Runloop处理事件源有两种，分别是input source和定时源(timer source)，主线程的Main runloop还会处理GCD事件源。
Runloop可以有多个RunloopMode,RunloopMode包含了输入源，定时源，和观察者。
输入源是Runloop所处理的事件源之一，主要用于线程或进程交互。输入源分为基于端口输入源(Source1)和非端口输入源(Source0)

source1与source0的区别？
1）source0和source1都是CFRunloopSourceRef类型，但配置方式不同，Source0用CFRunloopSourceContext来配置。source1用CFRunloopSourceContext1来配置。
2）source0和source1都可以用于线程(或进程)交互。但是交互的方式有所不同，sourc1监听端口，当端口有消息到达时，相应的source1就会被触发回调，完成响应的操作，而source0并不监听端口，让source0执行回调需要手动标记sou'c'r

//==========================================================================================================

