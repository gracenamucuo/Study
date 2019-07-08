//
//  PresentationDetailController.swift
//  T_Animations
//
//  Created by dyp on 2019/7/5.
//  Copyright © 2019 dyp. All rights reserved.
//

import UIKit

class PresentationDetailController: UIViewController {
    @IBOutlet weak var containerView: UIView!
    
    @IBOutlet weak var bgImage: UIImageView!
    @IBOutlet weak var desView: UITextView!
    @IBOutlet weak var titleView: UILabel!
    @IBOutlet weak var leftBtn: UIButton!
    @IBOutlet weak var rightBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func actionLicense(_ sender: UIButton) {
    }
    
    @IBAction func actionAuthor(_ sender: Any) {
    }
}
