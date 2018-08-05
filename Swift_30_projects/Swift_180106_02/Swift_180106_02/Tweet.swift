//
//  Tweet.swift
//  Swift_180106_02
//
//  Created by 戴运鹏 on 2018/1/6.
//  Copyright © 2018年 戴运鹏. All rights reserved.
//

import Foundation
struct Tweet {
    var gender : Gender
    var name:String
    var age :Int
    var work :String
    var salary :String
    var isStraight :Bool
    var interstedGender:String {
        switch gender {
        case .Female:
            return isStraight ? "Men" : "Women"
        case .Male:
            return isStraight ? "Women" : "Men"
            
        }
    }
    
    var info : String{
      return  "Hi, I am \(name). As a \(age)-year-old \(work) earning \(salary)/year, I am interested in \(interstedGender). Feel free to contact me!"
    }
    
    
    
    
    
    
}















































