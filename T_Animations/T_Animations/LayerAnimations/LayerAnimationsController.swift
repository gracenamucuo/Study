//
//  LayerAnimationsController.swift
//  T_Animations
//
//  Created by dyp on 2019/7/3.
//  Copyright © 2019 dyp. All rights reserved.
//

import UIKit
func delay(seconds:Double,completion:@escaping ()->Void) {
    DispatchQueue.main.asyncAfter(deadline: .now() + seconds, execute: completion)
}

func tintBackgroundColor(layer:CALayer,toColor:UIColor) {
    let tint = CABasicAnimation(keyPath: "backgroundColor")
    tint.fromValue = layer.backgroundColor
    tint.toValue = toColor.cgColor
    tint.duration = 0.5
    layer.add(tint, forKey: nil)
    layer.backgroundColor = toColor.cgColor
}

func roundCorners(layer:CALayer,toRadius:CGFloat) {
    let round = CABasicAnimation(keyPath: "cornerRadius")
    round.fromValue = layer.cornerRadius
    round.toValue = toRadius
    round.duration = 0.5
    layer.add(round, forKey: nil)
    layer.cornerRadius = toRadius
}

class LayerAnimationsController: UIViewController {

    @IBOutlet weak var heading: UILabel!
    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var cloud1: UIImageView!
    @IBOutlet weak var cloud2: UIImageView!
    @IBOutlet weak var cloud3: UIImageView!
    @IBOutlet weak var cloud4: UIImageView!
    @IBOutlet weak var loginBtn: UIButton!
    
    var spinner = UIActivityIndicatorView(style:.whiteLarge)
    let status = UIImageView(image: UIImage(named: "banner"))
    let label = UILabel()
    let messages = ["Connecting ....","Authorizing...","Sending credentials。。。","Failed"]
    var statusPosition = CGPoint.zero
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configUI()
    }
    
    func configUI() {
        //loginBtn
        loginBtn.layer.cornerRadius = 8.0
        loginBtn.layer.masksToBounds = true
        
        //spinner
        spinner.frame = CGRect(x: -20.0, y: 6.0, width: 20.0, height: 20.0)
        spinner.startAnimating()
        spinner.alpha = 0.0
        loginBtn.addSubview(spinner)
        
        //status
        status.isHidden = true
        status.center = loginBtn.center
        view.addSubview(status)
        
        //label
        label.frame = CGRect(x: 0.0, y: 0.0, width:status.frame.size.width, height: status.frame.size.height)
        label.font = UIFont(name: "HelveticaNeue", size: 18)
        label.textColor = UIColor.orange
        label.textAlignment = .center
        status.addSubview(label)
        
        statusPosition = status.center
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let flyRight = CABasicAnimation(keyPath: "positon.x")
        flyRight.fromValue = -view.bounds.width / 2.0
        flyRight.toValue = view.bounds.width / 2
        flyRight.duration = 0.5
        heading.layer.add(flyRight, forKey: nil)
        
        flyRight.beginTime = CACurrentMediaTime() + 0.3
        flyRight.fillMode = .both
        username.layer.add(flyRight, forKey:nil)
        
        flyRight.beginTime = CACurrentMediaTime() + 0.4
        password.layer.add(flyRight, forKey: nil)
        
        username.layer.position.x = view.bounds.width / 2
        password.layer.position.x = view.bounds.width / 2
        
        loginBtn.center.y += 30.0
        loginBtn.alpha = 0.0
        
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let fadeIn = CABasicAnimation(keyPath: "opacity")
        fadeIn.fromValue = 0.0
        fadeIn.toValue = 1.0
        fadeIn.duration = 0.5
        fadeIn.fillMode = .backwards
        fadeIn.beginTime = CACurrentMediaTime() + 0.5
        cloud1.layer.add(fadeIn, forKey: nil)
        
        fadeIn.beginTime = CACurrentMediaTime() + 0.7
        cloud2.layer.add(fadeIn, forKey: nil)
        
        fadeIn.beginTime = CACurrentMediaTime() + 0.9
        cloud3.layer.add(fadeIn, forKey: nil)
        
        fadeIn.beginTime = CACurrentMediaTime() + 1.1
        cloud4.layer.add(fadeIn, forKey: nil)
        
        UIView.animate(withDuration: 0.5, delay: 0.5, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.0, options: [], animations: {
            self.loginBtn.center.y -= 30.0
            self.loginBtn.alpha = 1.0
        }, completion: nil
        )
        animateCloud(cloud1)
        animateCloud(cloud2)
        animateCloud(cloud3)
        animateCloud(cloud4)
        
        
    }
    @IBAction func loginAction(_ sender: Any) {
        
    }
    
    func animateCloud(_ cloud:UIImageView) {
        let cloudSpeed = 60.0 / view.frame.width
        let duration = (view.frame.width - cloud.frame.origin.x) * cloudSpeed
        UIView.animate(withDuration: TimeInterval(duration), delay: 0.0, options: .curveLinear, animations: {
            cloud.frame.origin.x = self.view.frame.width
        }) { _ in
        cloud.frame.origin.x = -cloud.frame.width
        self.animateCloud(cloud)
        }
        
        
    }
}








































