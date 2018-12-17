//
//  ViewController.swift
//  DotsAnimations_14
//
//  Created by 戴运鹏 on 2018/12/17.
//  Copyright © 2018 戴运鹏. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var dotOne: UIImageView!
    @IBOutlet weak var dotTwo: UIImageView!
    @IBOutlet weak var dotThree: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        startAnimation()
    }
    
    func startAnimation() {
        dotOne.transform = CGAffineTransform(scaleX: 0.01, y: 0.01)
        dotTwo.transform = CGAffineTransform(scaleX: 0.01, y: 0.01)
        dotThree.transform = CGAffineTransform(scaleX: 0.01, y: 0.01)
        
        UIView.animate(withDuration: 0.6, delay: 0.0, options:[.repeat,.autoreverse], animations: {
            self.dotOne.transform = CGAffineTransform.identity
        }, completion: nil)
        
        UIView.animate(withDuration: 0.6, delay: 0.2, options: [.repeat,.autoreverse], animations: {
            self.dotTwo.transform = CGAffineTransform.identity
        }, completion: nil)
        
        UIView.animate(withDuration: 0.6, delay: 0.4, options: [.repeat,.autoreverse], animations: {
            self.dotThree.transform = CGAffineTransform.identity
        }, completion: nil)
    }


}

