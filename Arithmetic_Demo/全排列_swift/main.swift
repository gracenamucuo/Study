//
//  main.swift
//  全排列_swift
//
//  Created by 戴运鹏 on 2018/8/8.
//  Copyright © 2018年 戴运鹏. All rights reserved.
//

import Foundation

//func allPermutation(_ n: Int, _ results: [String]) -> [String] {
//    var newResults: [String] = []
//    for res in results {
//        for i in 0..<res.count {
//            let idx = String.Index(encodedOffset: i)
//            let result = String(res[res.startIndex..<idx]) + "\(n)" + String(res[idx..<res.endIndex])
//            newResults.append(result)
//        }
//        newResults.append(res + "\(n)")
//    }
//    return newResults
//}
//
//func permutation(_ n: Int) -> [String] {
//    guard n > 1 else {
//        return ["1"]
//    }
//    var results = ["1"]
//    for i in 2...n {
//        results = allPermutation(i, results)
//    }
//    return results
//}
//let start = Date().timeIntervalSince1970
//permutation(9)
//print(Date().timeIntervalSince1970 - start)
//func factorial(_ n: Int) -> Int {
//    guard n > 1 else {
//        return 1
//    }
//
//    return factorial(n-1) * n
//}
//
//func factorial2(_ n: Int64, _ sum: Int64) -> Int64 {
//    guard n > 1 else {
//        return sum
//    }
//    return factorial2(n-1, sum*n)
//}
//print(Int64.max);
////print(factorial(5))
//
//print(factorial2(20, 1))
func primefacter(_ n:Int,_ a:Int) -> [Int] {
    
}


