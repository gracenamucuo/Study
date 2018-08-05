//
//  ProductViewController.swift
//  Swift_180106_01
//
//  Created by 戴运鹏 on 2018/1/6.
//  Copyright © 2018年 戴运鹏. All rights reserved.
//

import UIKit

class ProductViewController: UIViewController {
    @IBOutlet weak var productImageView: UIImageView!
    
    @IBOutlet weak var productNameLabel: UILabel!
    var product :Product?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        productNameLabel.text = product?.name
        if let imageName = product?.fullscreenImageName {
            productImageView.image = UIImage.init(named: imageName)
        }
    }

    @IBAction func addCartAction(_ sender: UIButton) {
        print("Add to cart successfully")
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
