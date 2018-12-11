//
//  AppDelegate.swift
//  NotificationsUI_09
//
//  Created by 戴运鹏 on 2018/12/9.
//  Copyright © 2018 戴运鹏. All rights reserved.
//

import UIKit
import UserNotifications
@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        //请求权限
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert,.sound,.badge]) { (accpted, error) in
            if !accpted{
                print("Notification access denied")
            }
        }
        
        //渲染UI
        let action = UNNotificationAction(identifier: "remindLater", title: "Remind me later", options: [])
        let category = UNNotificationCategory(identifier: "normal", actions: [action], intentIdentifiers: [], options: [])
        UNUserNotificationCenter.current().setNotificationCategories([category])
        return true
    }
    
    //触发通知
    func scheduleNotification(at date:Date) {
//        UNUserNotificationCenter.current().delegate = self
        
        let calendar = Calendar(identifier: .gregorian)
        let components = calendar.dateComponents(in: .current, from: date)
         let newComponents = DateComponents.init(calendar: calendar, timeZone: .current, month: components.month, day: components.day, hour: components.hour, minute: components.minute)
        
        let trigger = UNCalendarNotificationTrigger(dateMatching: newComponents, repeats: false)
        let content = UNMutableNotificationContent()
        content.title = "Coding Reminder"
        content.body = "Raady to code?let us do some Swift!"
        content.sound = UNNotificationSound.default
        content.categoryIdentifier = "normal"
        
        if let path = Bundle.main.path(forResource: "Swift", ofType: "png") {
            let url = URL(fileURLWithPath: path)
            do{
                let attachment = try UNNotificationAttachment(identifier: "Swift", url: url, options: nil)
                content.attachments = [attachment]
                
            }catch{
                print("The attachment was loaded")
            }
            
        }
        
        let request = UNNotificationRequest(identifier: "textNotification", content: content, trigger: trigger)
        
        UNUserNotificationCenter.current().removeAllPendingNotificationRequests()
        
        UNUserNotificationCenter.current().add(request) { (error) in
            if let error = error
            {
                print("Error :" + error.localizedDescription)
            }
        }
        
        
    }


}

//extension AppDelegate:UNUserNotificationCenterDelegate
//{
//    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
//        if response.actionIdentifier == "remindLater" {
//            let newDate = Date(timeInterval: 60, since: Date())
//            print("回调代理")
//            scheduleNotification(at: newDate)
//
//        }
//    }
//}











































































