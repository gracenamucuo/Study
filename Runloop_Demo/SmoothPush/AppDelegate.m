//
//  AppDelegate.m
//  SmoothPush
//
//  Created by 戴运鹏 on 2018/5/26.
//  Copyright © 2018年 戴运鹏. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    CFRunLoopObserverRef observer = CFRunLoopObserverCreateWithHandler(CFAllocatorGetDefault(), kCFRunLoopAllActivities, YES, 0, ^(CFRunLoopObserverRef observer, CFRunLoopActivity activity) {
        switch (activity) {
            case 1:
            {
                NSLog(@"进入runloop");
                break;
            }
            case 2:
            {
                NSLog(@"将要处理定时器源");
                break;
            }
            case 4:
            {
                NSLog(@"将要处理输入源");
                break;
            }
            case 32:
            {
                NSLog(@"将要进入休眠");
                break;
            }
                
            case 64:
            {
                NSLog(@"休眠结束");
                break;
            }
            case 128:
            {
                
                NSLog(@"退出");
                break;
            }
            default:
                NSLog(@"其他");
                break;
        }
    });
    CFRunLoopAddObserver(CFRunLoopGetCurrent(), observer, kCFRunLoopCommonModes);//将观察者添加到common模式下，这样当default模式和UITrackingRunLoopMode两种模式下都有回调。
    
    CFRelease(observer);
    
//    UIWindow *keyWindow = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
//    self.window = keyWindow;
//    self.window.backgroundColor = [UIColor whiteColor];
//    self.window.rootViewController = [[ViewController alloc]init];
//    [self.window makeKeyAndVisible];
    
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
