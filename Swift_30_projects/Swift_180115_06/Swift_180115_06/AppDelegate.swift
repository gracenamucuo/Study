//
//  AppDelegate.swift
//  Swift_180115_06
//
//  Created by 戴运鹏 on 2018/1/15.
//  Copyright © 2018年 戴运鹏. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate,UISplitViewControllerDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        let splitViewController = window!.rootViewController as!UISplitViewController
        let navigationController = splitViewController.viewControllers[splitViewController.viewControllers.count - 1] as! UINavigationController
        navigationController.topViewController!.navigationItem.leftBarButtonItem = splitViewController.displayModeButtonItem
        splitViewController.delegate = self
        UISearchBar.appearance().tintColor = UIColor.white
        UISearchBar.appearance().barTintColor = UIColor.candyGreen()
        UITextField.appearance(whenContainedInInstancesOf: [UISearchBar.self]).tintColor = UIColor.candyGreen()
        
        
        
        return true
    }


    func splitViewController(_ splitViewController: UISplitViewController, collapseSecondary secondaryViewController: UIViewController, onto primaryViewController: UIViewController) -> Bool {
        guard let secondaryAsNavController = secondaryViewController as? UINavigationController else {return false}
        guard let topAsDetailController = secondaryAsNavController.topViewController as? DetailViewController  else { return false }
        if topAsDetailController.detailCandy == nil {
            return true
        }
        return false
    }

}

extension UIColor{
    static func candyGreen() -> UIColor{
        return UIColor.init(red: 67.0 / 255, green: 205 / 255, blue: 135 / 255, alpha: 1.0)
    }
}
































































