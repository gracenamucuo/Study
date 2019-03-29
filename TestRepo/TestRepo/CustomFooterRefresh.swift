//
//  CustomFooterRefresh.swift
//  TestRepo
//
//  Created by 戴运鹏 on 2019/1/14.
//  Copyright © 2019 戴运鹏. All rights reserved.
//

import UIKit

class CustomFooterRefresh: UIView {
    let activity = UIActivityIndicatorView()
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(activity)
        activity.center = center
        activity.style = .whiteLarge
        activity.startAnimating()
        backgroundColor = UIColor.red
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
