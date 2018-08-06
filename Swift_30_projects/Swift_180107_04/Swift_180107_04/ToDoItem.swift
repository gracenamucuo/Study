//
//  ToDoItem.swift
//  Swift_180107_04
//
//  Created by 戴运鹏 on 2018/1/7.
//  Copyright © 2018年 戴运鹏. All rights reserved.
//

import Foundation

class ToDoItem: NSObject {
    var id:String
    var image:String
    var title:String
    var date:Date
    init(id:String,image:String,title:String,date:Date) {
        self.id = id
        self.image = image
        self.title = title
        self.date = date
    }
    
    
}






