//
//  NewsTableViewCell.swift
//  Swift_180116_06
//
//  Created by 戴运鹏 on 2018/1/16.
//  Copyright © 2018年 戴运鹏. All rights reserved.
//

import UIKit

enum CellState {
    case expanded
    case collapsed
}

class NewsTableViewCell: UITableViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!{
        didSet{
            descriptionLabel.numberOfLines = 4
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
