//
//  ViewController.swift
//  SwiftForwardDemo
//
//  Created by 戴运鹏 on 2019/1/22.
//  Copyright © 2019 戴运鹏. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var aniView:UIView?
    var blueView:UIView?
    
    var ani:CABasicAnimation?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let animationView = UIView.init(frame: CGRect.init(origin: CGPoint.zero, size: CGSize.init(width: 100, height: 100)))
        animationView.center = view.center
        animationView.backgroundColor = UIColor.red
        view.addSubview(animationView)
        
        
        let animation = CABasicAnimation.init()
        animation.timingFunction = CAMediaTimingFunction.init(name: .easeInEaseOut)
        animation.autoreverses = true
        animation.delegate = self
        animation.keyPath = "bounds.size"
        animation.fromValue = CGSize.init(width: 0.1, height: 0.1)
        animation.toValue = CGSize.init(width: 200, height: 200)
        animation.repeatCount = 1
//        animation.duration = 0.3
        aniView = animationView
        animation.isRemovedOnCompletion = false
        animationView.layer.add(animation, forKey: "aniKey")
        ani = animation
        
        blueView = UIView.init(frame: CGRect.init(origin: CGPoint.zero, size: CGSize.init(width: 100, height: 100)))
        blueView?.backgroundColor = UIColor.blue
        view.addSubview(blueView ?? UIView.init())
        
        
    }


}

extension ViewController:DispatchProtocol
{
    
    static func callMethod() {
        print("重写类型方法")
    }
    func dynamicDispatchMethod() {
        print("动态重写")
    }
   
    func staticDispatchMethod() {
        print("静态重写")
    }
}

class SonVC: ViewController {
    
}

extension ViewController:CAAnimationDelegate{
    func animationDidStart(_ anim: CAAnimation) {
        
    }
    func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        let animation = aniView?.layer.animation(forKey: "aniKey")
//        aniView?.layer.removeAllAnimations()
        blueView?.layer.removeAllAnimations()
        blueView?.layer.add(animation!, forKey: nil)
//        aniView?.layer.add(ani ?? CABasicAnimation.init(), forKey: "aniKey")
    }
}
