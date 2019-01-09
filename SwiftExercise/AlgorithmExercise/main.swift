//
//  main.swift
//  AlgorithmExercise
//
//  Created by 戴运鹏 on 2019/1/8.
//  Copyright © 2019 戴运鹏. All rights reserved.
//

import Foundation

public func insertionSort<T>(_ elements: [T]) -> [T] where T: Comparable {
    var array = elements
    guard array.count > 1 else {
        return array
    }
    for current in 1..<array.count {
        let value = array[current]
        var pre = current - 1;
        // 查找要插入的位置并移动数据
        while (pre >= 0 && value < array[pre]){
            array[pre + 1] = array[pre]
            pre -= 1
        }
        //插入
        array[pre+1] = value
    }
    return array
}
print(insertionSort([10,1,8,5,9,0,-2]))

func insertSort<T:Comparable>(_ originalArray:[T]) -> [T] {
    guard originalArray.count > 1 else {
        return originalArray
    }
    var arr = originalArray
    
    for i in 1..<arr.count {
        let value = arr[i]
        var pre = i - 1
        
        while (pre >= 0) && (arr[pre+1] < arr[pre]){
            arr[pre+1] = arr[pre]
            arr[pre] = value
            pre -= 1
        }
        arr[pre+1] = value
    }
    return arr
}

print(insertSort([4,2,9,-1,0,-9,10,14,15]))
