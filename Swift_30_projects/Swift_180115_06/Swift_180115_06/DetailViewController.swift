//
//  DetailViewController.swift
//  Swift_180115_06
//
//  Created by 戴运鹏 on 2018/1/15.
//  Copyright © 2018年 戴运鹏. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var detailDescriptionLabel: UILabel!
    
    
    @IBOutlet weak var candyImageView: UIImageView!
    
    var detailCandy: Candy? {
        didSet {
            configureView()
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
        // Do any additional setup after loading the view.
    }

    func configureView() {
        if let detailCandy = detailCandy {
            if  let detailDescriptionLabel = detailDescriptionLabel, let candyImageView = candyImageView{
                detailDescriptionLabel.text = detailCandy.name
                candyImageView.image = UIImage.init(named: detailCandy.name)
                title = detailCandy.category
            }
        }
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
