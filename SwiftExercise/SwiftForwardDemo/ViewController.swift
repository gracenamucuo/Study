//
//  ViewController.swift
//  SwiftForwardDemo
//
//  Created by 戴运鹏 on 2019/1/22.
//  Copyright © 2019 戴运鹏. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
     ViewController.callMethod()
        
        SonVC.callMethod()
        
        
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
