//
//  File.swift
//  Swift_180106_03
//
//  Created by 戴运鹏 on 2018/1/6.
//  Copyright © 2018年 戴运鹏. All rights reserved.
//

import Foundation
class Stopwatch: NSObject {
    var counter:Double
    var timer :Timer
    override init() {
        counter = 0.0
        timer = Timer()
    }
    
}


