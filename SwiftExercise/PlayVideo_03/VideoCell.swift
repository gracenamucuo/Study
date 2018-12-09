//
//  VideoCell.swift
//  PlayVideo_03
//
//  Created by 戴运鹏 on 2018/12/9.
//  Copyright © 2018 戴运鹏. All rights reserved.
//

import UIKit

struct Video {
    let image:String
    let title:String
    let source:String
}

class VideoCell: UITableViewCell {

    @IBOutlet weak var bottomImageView: UIImageView!
    @IBOutlet weak var sourceLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var playBtn: UIButton!
    
    var delegate:CellPlayProtocol?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    @IBAction func playAction(_ sender: Any) {
        delegate?.didPlayActionClick()
    }
    
}

protocol CellPlayProtocol {
    func didPlayActionClick()
}
