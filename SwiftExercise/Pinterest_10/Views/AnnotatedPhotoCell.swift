//
//  AnnotatedPhotoCell.swift
//  Pinterest_10
//
//  Created by 戴运鹏 on 2018/12/13.
//  Copyright © 2018 戴运鹏. All rights reserved.
//

import UIKit

class AnnotatedPhotoCell: UICollectionViewCell {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var imageHeight: NSLayoutConstraint!
    @IBOutlet weak var captionLabel: UILabel!
    @IBOutlet weak var commentLabel: UILabel!
    
    
    var photo:Photo?{
        didSet{
            if let photo = photo {
                imageView.image = photo.image
                captionLabel.text = photo.caption
                commentLabel.text = photo.comment
            }
        }
    }
    
    override func apply(_ layoutAttributes: UICollectionViewLayoutAttributes) {
        super.apply(layoutAttributes)
        if let attributes = layoutAttributes as? PinterestLayoutAttributes {
            imageHeight.constant = attributes.photoHeight
        }
    }
    
    
}
