//
//  main.swift
//  InitializeExercise
//
//  Created by 戴运鹏 on 2018/11/18.
//  Copyright © 2018 戴运鹏. All rights reserved.
//

import Foundation

class Person {
    var name:String
    var age:Int{
        return 10
    }
    init(name:String) {
        self.name = name
    }
    
}

class Son: Person {
    var sex = "male"
}


let son = Son(name: "儿子")
let arr = [son]
if arr[0] is Person{
    print("是")
}
var name:String?
var name1:String!

var n = "1"

n = name ?? ""
var n1 = name1



























































