//
//  AppDelegate.m
//  IM_demo
//
//  Created by 戴运鹏 on 2018/9/7.
//  Copyright © 2018年 戴运鹏. All rights reserved.
//

#import "AppDelegate.h"
#import <NIMKit/NIMKit.h>
#import "TestDataProvider.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [self configIMUI];
    return YES;
}

- (void)configIMUI
{
       [[NIMSDK sharedSDK] registerWithAppID:@"8fc95f505b6cbaedf613677c8e08fc0b" cerName:nil];
    [[NIMSDK sharedSDK].loginManager login:@"lilei" token:@"123456" completion:^(NSError *error) {
        if (!error) {
            NSLog(@"登录成功");
            //创建会话列表页
        }else{
            NSLog(@"登录失败");
        }
    }];
    [[NIMKit sharedKit] registerLayoutConfig:[NIMCellLayoutConfig new]];
    [NIMKit sharedKit].provider = [TestDataProvider new];
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