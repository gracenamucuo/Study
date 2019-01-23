//
//  ProtocolDispatch.swift
//  SwiftForwardDemo
//
//  Created by 戴运鹏 on 2019/1/22.
//  Copyright © 2019 戴运鹏. All rights reserved.
//

import Foundation
import UIKit
protocol DispatchProtocol {
    
    
    func dynamicDispatchMethod()
//   static func callMethod()
    
//    func staticDispatchMethod()
}
extension DispatchProtocol{
    func staticDispatchMethod() {
        print("静态派发的方法")
    }
    
    func dynamicDispatchMethod(){
        print("动态派发的方法")
    }
    
   static func callMethod() {
        print("类型方法")
    }
    
}

