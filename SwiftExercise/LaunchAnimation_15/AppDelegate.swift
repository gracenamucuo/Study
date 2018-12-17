//
//  AppDelegate.swift
//  LaunchAnimation_15
//
//  Created by 戴运鹏 on 2018/12/17.
//  Copyright © 2018 戴运鹏. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate{

    var window: UIWindow?
    var mask:CALayer?
    var imageView:UIImageView?
    
    

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        
        if let window = window {
            imageView = UIImageView(frame: window.frame)
            imageView?.image = UIImage(named: "twitterScreen")
            window.addSubview(imageView!)
            
            mask = CALayer()
            mask?.contents = UIImage(named: "twitterBird")?.cgImage
            mask?.position = window.center
            mask?.bounds = CGRect(x: 0, y: 0, width: 100, height: 80)
            imageView?.layer.mask = mask
            
            animateMask()
            
            window.rootViewController  = ViewController()
            window.backgroundColor = UIColor(red: 70/255, green: 154/255, blue: 233/255, alpha: 1)
            window.makeKeyAndVisible()
            
        }
        
        UIApplication.shared.isStatusBarHidden = true
        return true
    }

}

extension AppDelegate:CAAnimationDelegate
{
    
    func animateMask() {
        let keyFrameAni = CAKeyframeAnimation(keyPath: "bounds")
        keyFrameAni.delegate = self
        keyFrameAni.duration = 1
        keyFrameAni.beginTime = CACurrentMediaTime() + 1
        
        let initalBounds = NSValue(cgRect: mask!.bounds)
        let secondBounds = NSValue(cgRect: CGRect(x: 0, y: 0, width: 80, height: 64))
        let finalBounds = NSValue(cgRect: CGRect(x: 0, y: 0, width: 2000, height: 2000))
        keyFrameAni.values = [initalBounds,secondBounds,finalBounds]
        
        keyFrameAni.keyTimes = [0,0.3,1]
        
        keyFrameAni.timingFunctions = [CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut), CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeOut)]
        mask?.add(keyFrameAni, forKey: "bounds")
        
    }
    
    func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
        imageView?.layer.mask = nil
    }
}








































