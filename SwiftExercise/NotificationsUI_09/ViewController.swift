//
//  ViewController.swift
//  NotificationsUI_09
//
//  Created by 戴运鹏 on 2018/12/9.
//  Copyright © 2018 戴运鹏. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


    @IBAction func changeDateAction(_ sender: UIDatePicker) {
       if let delegate = UIApplication.shared.delegate as? AppDelegate{
            delegate.scheduleNotification(at: sender.date)
        }
        
    }
}

