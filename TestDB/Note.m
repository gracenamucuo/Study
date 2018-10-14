//
//  Note.m
//  TestDB
//
//  Created by 戴运鹏 on 2018/10/10.
//  Copyright © 2018年 戴运鹏. All rights reserved.
//

#import <Foundation/Foundation.h>
//1.在子线程中发通知，收到通知也是在该子线程中。
//2.timerWithTimeInterval开头的api初始化的NSTimer，需要加入runloop才能开始触发。scheduledTimerWithTimeInterval开头的api初始化的NSTimer，已经默认加入到了default Mode的中。
//3.GCD定时器能在子线程中执行，但是NSTimer不行。
//4.目前看出，GCD和NSTimer的定时器，如果触发的事件的执行时间超过了定时间隔，会将事件执行完之后，再开始下一个事件。❓
//5，CADisplayLink如果在dealloc方法里invalite的话，控制器不会销毁，需要在定时执行结束的时候，销毁。


