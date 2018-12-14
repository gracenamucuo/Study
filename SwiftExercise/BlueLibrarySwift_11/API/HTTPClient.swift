//
//  HTTPClient.swift
//  BlueLibrarySwift_11
//
//  Created by 戴运鹏 on 2018/12/14.
//  Copyright © 2018 戴运鹏. All rights reserved.
//

import UIKit
class HTTPClient {
    func getRequest(_ url:String) -> (AnyObject) {
        return Data() as (AnyObject)
    }
    
    func postRequest(_ url:String,body:String) -> (AnyObject) {
        return Data() as (AnyObject)
    }
    
    func downloadImage(_ url:String) -> (UIImage) {
        let aUrl = URL(string: url)
        guard let data = try? Data(contentsOf: aUrl!) else {
            return UIImage()
        }
        
        let image = UIImage(data: data)
        return image!
    }
}


