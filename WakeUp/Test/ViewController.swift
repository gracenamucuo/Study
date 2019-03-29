//
//  ViewController.swift
//  Test
//
//  Created by 戴运鹏 on 2019/1/11.
//  Copyright © 2019 戴运鹏. All rights reserved.
//

import UIKit


public struct Test {
    public static func test(_ a:String) {
//        print("===////")
    }
}

//Test.test()


class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        Test.test("122")
    }

    

}

