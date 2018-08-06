//
//  ArtistTableViewCell.swift
//  Swift_180107_05
//
//  Created by 戴运鹏 on 2018/1/7.
//  Copyright © 2018年 戴运鹏. All rights reserved.
//

import UIKit

class ArtistTableViewCell: UITableViewCell {

    @IBOutlet weak var bioLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var picImageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
