//
//  ContactViewController.swift
//  Swift_180106_01
//
//  Created by 戴运鹏 on 2018/1/6.
//  Copyright © 2018年 戴运鹏. All rights reserved.
//

import UIKit

class ContactViewController: UIViewController {

    @IBOutlet var scrollView: UIScrollView!
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(scrollView)
        // Do any additional setup after loading the view.
    }

    override func viewDidLayoutSubviews() {
        if #available(iOS 11, *) {
            scrollView.frame = CGRect.init(x: 0, y: view.safeAreaInsets.top, width: view.frame.width, height: view.frame.height - view.safeAreaInsets.bottom - view.safeAreaInsets.top)
        } else {
            scrollView.frame = CGRect.init(x: 0, y: topLayoutGuide.length, width: view.frame.width, height: view.frame.height - topLayoutGuide.length - bottomLayoutGuide.length)
        }
        scrollView.contentSize = CGSize.init(width: view.frame.width, height: 800) 
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
