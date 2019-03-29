//
//  CustomTableView.swift
//  TestRepo
//
//  Created by 戴运鹏 on 2019/1/14.
//  Copyright © 2019 戴运鹏. All rights reserved.
//

import UIKit

class CustomTableView: UITableView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    override func awakeFromNib() {
        super.awakeFromNib()
        print("初始化")
    }
    
    deinit {
        print("销毁了  自定义")
    }

}
