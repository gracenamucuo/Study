//
//  main.swift
//  WakeUp
//
//  Created by 戴运鹏 on 2019/1/9.
//  Copyright © 2019 戴运鹏. All rights reserved.
//

import Foundation

func insertSort<T:Comparable>(_ originalArray:[T]) -> [T] {
    guard originalArray.count > 1 else {
        return originalArray
    }
    var arr = originalArray
    
    for i in 1..<arr.count {
        let value = arr[i]
        var pre = i - 1
        
        while (pre >= 0) && (arr[pre] < value){
            arr[pre+1] = arr[pre]
            pre -= 1
        }
        arr[pre+1] = value
    }
    return arr
}
print(insertSort([4,2,9,-1,0,-9,10,14,15]))

func selectSort<T:Comparable>(_ originalArray:[T],by order:(_ a:T,_ b:T)->Bool)->[T] {
    guard originalArray.count > 1 else {//有序  无序 在无序中找到最大或最小的值后，再放到有序的尾部
        return originalArray
    }
    var sorted = originalArray
    
    for i in 0 ..< sorted.count {
        var min = sorted[i]
        var index = i
        
        for j in i ..< sorted.count{
            if order(min,sorted[j]){
                min = sorted[j]
                index = j
            }
        }
        sorted.swapAt(i, index)
    }
    return sorted
}
//print(selectSort([4,2,9,-1,0,-9,10,14,15], by: >))

func mergeSort<T:Comparable>(_ originalArray:[T],_ start:Int,_ end:Int,by order:@escaping (_ a:T,_ b:T)->Bool) -> [T] {
    guard start < end else {
    return originalArray
}
    func merge(_ part1:[T],_ part2:[T])->[T]{
        var temp:[T] = Array()
        var i = 0
        var j = 0
        
        while i < part1.count && j < part2.count {
            if order(part1[i],part2[j]){
                temp.append(part2[j])
                j+=1
            }else{
                temp.append(part1[i])
                i += 1
            }
        }
        if i == part1.count {
            temp.append(contentsOf: part2[j..<part2.count])
        }else{
            temp.append(contentsOf: part1[i..<part1.count])
        }
        return temp
    }
    
    func mergeResolve(_ data:[T],_ start:Int,_ end:Int)->[T]{
        guard start < end else {
            return data
        }
        let mid = (end - start) / 2
       let part1 = mergeResolve(Array(data[start...mid]), 0, mid-start)
       let part2 = mergeResolve(Array(data[mid+1...end]), 0, end-mid-1)
        return merge(part1, part2)
    }
    return mergeResolve(originalArray, start, end)
}
//print(mergeSort([4,2,9,-1,0,-9,10,14,15], 0, [4,2,9,-1,0,-9,10,14,15].count - 1, by: >))

