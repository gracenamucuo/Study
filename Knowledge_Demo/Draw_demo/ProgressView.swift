//
//  ProgressView.swift
//  Draw_Demo
//
//  Created by 戴运鹏 on 2019/3/1.
//  Copyright © 2019 戴运鹏. All rights reserved.
//

import Foundation
import UIKit
import CoreGraphics

class ProgressView: UIView {
    var progress:Double = 0.7
    
    override var intrinsicContentSize: CGSize{
        return CGSize(width: 37, height: 37)
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
//        self.backgroundColor = UIColor.red
        
        
    }
    
    convenience init() {
        self.init(frame: CGRect(x: 0, y: 0, width: 37, height: 37))
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func draw(_ rect: CGRect) {
//        let context = UIGraphicsGetCurrentContext()
        let lineWidth:CGFloat = 2.0
        let progressBackgroundPath = UIBezierPath.init()
        progressBackgroundPath.lineWidth = lineWidth
        progressBackgroundPath.lineCapStyle = .butt
        
        let center = CGPoint(x:self.bounds.width / 2, y: self.bounds.height / 2)
        let radius = (self.bounds.width - lineWidth) / 2
        let startAngle = -Double.pi/2
        var endAngle = 2 * Double.pi + startAngle
        progressBackgroundPath.addArc(withCenter: center, radius: radius, startAngle: CGFloat(startAngle), endAngle: CGFloat(endAngle), clockwise: true)
        UIColor.red.set()
        progressBackgroundPath.stroke()
        
        let progressPath = UIBezierPath.init()
        progressPath.lineCapStyle = .square
        progressPath.lineWidth = lineWidth
        endAngle = progress * 2 * Double.pi + startAngle
        progressPath .addArc(withCenter: center, radius: radius, startAngle: CGFloat(startAngle), endAngle: CGFloat(endAngle), clockwise: true)
        UIColor.green.set()
        progressPath.stroke()
        
        
        
        
        
        
    }
}
