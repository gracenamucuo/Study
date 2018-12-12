//
//  UIImage+Decompression.swift
//  Pinterest_10
//
//  Created by 戴运鹏 on 2018/12/12.
//  Copyright © 2018 戴运鹏. All rights reserved.
//

import UIKit
extension UIImage
{
    var decompressedImage:UIImage{
        UIGraphicsBeginImageContextWithOptions(size, true, 0)
        draw(at: CGPoint.zero)
        let decompressedImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return decompressedImage!
    }
    
}


