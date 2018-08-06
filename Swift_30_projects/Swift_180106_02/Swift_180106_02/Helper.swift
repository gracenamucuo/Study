//
//  Helper.swift
//  Swift_180106_02
//
//  Created by 戴运鹏 on 2018/1/6.
//  Copyright © 2018年 戴运鹏. All rights reserved.
//

import UIKit
import Social

enum Gender : Int {
    case Male = 0,Female
}

extension Selector{
    static let endEditing = #selector(UIView.endEditing(_:))
}

extension UIViewController{
    func showAlert(title:String,msg:String,bottonTitle:String) {
        let alert  = UIAlertController.init(title: title, message: msg, preferredStyle: .alert)
        alert.addAction(UIAlertAction.init(title: bottonTitle, style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
        
    }
}



























