//
//  ETHUDAnimation.swift
//  TestRepo
//
//  Created by 戴运鹏 on 2019/1/9.
//  Copyright © 2019 戴运鹏. All rights reserved.
//

import Foundation
import QuartzCore

class ETHUDAnimation {

    static let loading: CAAnimation = {
        let animation = CABasicAnimation(keyPath: "position.x")
        animation.fromValue = 65
        animation.toValue = 175
        animation.duration = 0.5
        animation.timingFunction = CAMediaTimingFunction.init(name:CAMediaTimingFunctionName.easeInEaseOut)
        animation.repeatCount = Float(INT_MAX)
        return animation
    }()
    
    
}









