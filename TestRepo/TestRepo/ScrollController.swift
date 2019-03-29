//
//  ScrollController.swift
//  TestRepo
//
//  Created by 戴运鹏 on 2019/1/18.
//  Copyright © 2019 戴运鹏. All rights reserved.
//

import UIKit

class ScrollController: UIViewController {

    @IBOutlet weak var scroll: UIScrollView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    

}

//extension ScrollController:ETRefreshable
//{
//    var scrollView: UIScrollView {
//        get {
//            return self.scroll
//        }
// 
//    }
//
//    func requestData(success: @escaping (Int) -> Void) {
//        let delay = DispatchTime.now() + 2
//        DispatchQueue.main.asyncAfter(deadline: delay, execute: {
//            print("请求成功了")
//        
//            success(10)
//        })
//    }
//    
//    func loadMoreData(success: @escaping (Int) -> Void) {
//        let delay = DispatchTime.now() + 2
//        DispatchQueue.main.asyncAfter(deadline: delay, execute: {
//            
//            print("加载更多了")
//            success(10)
//        })
//    }
//    
//    
//}
