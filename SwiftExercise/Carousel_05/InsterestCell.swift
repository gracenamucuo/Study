//
//  InsterestCell.swift
//  Carousel_05
//
//  Created by 戴运鹏 on 2018/12/9.
//  Copyright © 2018 戴运鹏. All rights reserved.
//

import UIKit

class InsterestCell: UICollectionViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var iamgeView: UIImageView!
    
    var interest:Interest!
    {
        didSet
        {
           updateUI()
        }
    }
    
   fileprivate func updateUI() {
    iamgeView.image = interest.featuredImage
    titleLabel.text = interest.title
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.layer.cornerRadius = 5.0
        self.clipsToBounds = true
    }
}
