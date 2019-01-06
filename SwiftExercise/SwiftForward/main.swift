//
//  main.swift
//  SwiftForward
//
//  Created by 戴运鹏 on 2019/1/6.
//  Copyright © 2019 戴运鹏. All rights reserved.
//

import Foundation

//================================================【【【【数组】】】】=======================================
let arr = [1,3,5,9]
for x in arr{
    print(x)
    if x == 3{
    break
    }
}

let noFirst = arr.dropFirst()
//map:传进去一个函数，该函数会作用在数组的所有元素上。
let squares = arr.map { (indic) in
    indic * indic
}
let simple = arr.map {$0 * $0}

print(squares,simple)
//map的一种实现:map将模板代码分离出来，map函数通过调用者所提供的变换函数作为参数
extension Array{
    func map<T>(_ tramsform:(Element)->T) -> [T] {
        var result:[T] = []
        result.reserveCapacity(count)
        for x in self {
            result.append(tramsform(x))
        }
        return result
    }
}

let idx = arr.index(of:2)

print(Array.init(arr.reversed()))

extension Sequence{
    func last(where predicate:(Iterator.Element)->Bool) -> Iterator.Element? {
        for element in reversed() where predicate(element) {
            return element
        }
        return nil
    }
}

let match = ["john","rose","xiaoming"].last { (a) -> Bool in
    a.hasSuffix("n")
}
print(match)
print(arr.last {$0 % 2 == 1})

