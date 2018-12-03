//
//  Models.swift
//  RxSwiftDemo
//
//  Created by 戴运鹏 on 2018/12/2.
//  Copyright © 2018 戴运鹏. All rights reserved.
//

import Foundation

struct Music {
    let name:String
    let singer:String
    init(name:String,singer:String) {
        self.name = name
        self.singer = singer
    }
    
}

extension Music:CustomStringConvertible
{
    var description:String {
        return "name\(name) singer:\(singer)"
    }
    
}
