//
//  Composite.swift
//  Appdelegate解耦
//
//  Created by 戴运鹏 on 2019/2/13.
//  Copyright © 2019 戴运鹏. All rights reserved.
//

import Foundation
import UIKit
typealias AppdelegateType = UIResponder & UIApplicationDelegate
class PushNotificationAppdelegate: AppdelegateType {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        print("初始化远程通知")
        return true
    }
    
    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        print("推送相关")
    }
}


class LaunchAppdelegate: AppdelegateType {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        print("启动页设置")
        return true
    }
}

class ThirdPartiesAppdelegate: AppdelegateType {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        print("第三方相关配置")
        return true
    }
    func applicationDidEnterBackground(_ application: UIApplication) {
        print("进入后台")
    }
    func applicationDidBecomeActive(_ application: UIApplication) {
        print("唤醒前台")
    }
}

class CompositeAppdelegate: AppdelegateType {
    let appdelegates:[AppdelegateType]
    init(appdelegates:[AppdelegateType]) {
        self.appdelegates = appdelegates
    }
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        appdelegates.forEach {_ = $0.application?(application, didFinishLaunchingWithOptions: launchOptions)
        }
        return true
    }
    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        appdelegates.forEach { $0.application?(application, didRegisterForRemoteNotificationsWithDeviceToken: deviceToken)
        }
    }
    func applicationDidEnterBackground(_ application: UIApplication) {
        appdelegates.forEach{$0.applicationDidEnterBackground?(application)}
    }
    
    func applicationDidBecomeActive(_ application: UIApplication) {
        appdelegates.forEach { $0.applicationDidBecomeActive?(application)}
    }
    
}

public class AppdelegateFactory {
   static func makeDefault() -> AppdelegateType {
        return CompositeAppdelegate(appdelegates: [PushNotificationAppdelegate(),LaunchAppdelegate(),ThirdPartiesAppdelegate()])
    }
}
