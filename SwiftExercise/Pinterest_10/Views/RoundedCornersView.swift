//
//  RoundedCornersView.swift
//  Pinterest_10
//
//  Created by 戴运鹏 on 2018/12/13.
//  Copyright © 2018 戴运鹏. All rights reserved.
//

import UIKit

class RoundedCornersView: UIView {
  
  @IBInspectable var cornerRadius :CGFloat = 0
    {
        didSet{
            layer.cornerRadius = cornerRadius
            layer.masksToBounds = cornerRadius > 0
        }
    }
    


}
