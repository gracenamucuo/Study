//
//  FBMeBaseCell.swift
//  Swift_180228_08
//
//  Created by 戴运鹏 on 2018/2/28.
//  Copyright © 2018年 戴运鹏. All rights reserved.
//

import UIKit

class FBMeBaseCell: UITableViewCell {
    static let identifier = "FBMeBaseCell"
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier:reuseIdentifier )
        backgroundColor = Specs.color.white
        textLabel?.textColor = Specs.color.black
        textLabel?.font = Specs.font.large
        
        detailTextLabel?.font = Specs.font.small
        detailTextLabel?.textColor = Specs.color.gray
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(color:) has not been implmented")
    }


}








































































































