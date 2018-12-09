//
//  CustomCell.swift
//  SwiftExercise
//
//  Created by 戴运鹏 on 2018/12/2.
//  Copyright © 2018 戴运鹏. All rights reserved.
//

import UIKit

class CustomCell: UITableViewCell {
    var pic: UIImageView?
    var title:UILabel?
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
        pic = UIImageView.init(frame: CGRect.init(x: 10, y: 10, width: 30, height: 30))
        pic?.backgroundColor = UIColor.green
        self.contentView.addSubview(pic!)
        
        title = UILabel.init(frame: CGRect.init(x: 10, y: 50, width: 100, height: 30))
        self.contentView.addSubview(title!)
//        title?.text = "你好"
        title?.textColor = UIColor.red
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    //
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
