//
//  main.swift
//  AlgorithmExercise
//
//  Created by 戴运鹏 on 2019/1/8.
//  Copyright © 2019 戴运鹏. All rights reserved.
//

import Foundation
///=================插入排序=====================
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
//print(insertionSort([10,1,8,5,9,0,-2]))

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

//print(insertSort([4,2,9,-1,0,-9,10,14,15]))

///====================选择排序=================================

func selectionSort<T:Comparable>(_ originalData:[T]) -> [T] {
    guard originalData.count > 1 else {
        return originalData
    }
    var sortedArray = originalData
    
    for i in 0..<sortedArray.count {
        let currnt = sortedArray[i]
        var min = currnt
        var index = i
        
        for j in i..<sortedArray.count{
            if sortedArray[j] < min{
                min = sortedArray[j]
                index = j
            }
        }
        sortedArray.swapAt(i, index)
}

    return sortedArray
}

//print(selectionSort([4,2,9,-1,0,-9,10,14,15]))
///======================归并排序==============================

func mergeSort<T:Comparable>(_ originalData:[T]) -> [T] {// 分解--->合并
    guard originalData.count > 1 else {
        return originalData
    }
    
    func merge<T:Comparable>(_ arr1:[T],_ arr2:[T]) -> [T] {//合并
        guard arr1.count > 0 && arr2.count > 0 else {
            return []
        }
        var merge = [T]()
        var i = 0
        var j = 0
        while i < arr1.count && j < arr2.count {
            if arr1[i] >= arr2[j]{
                merge.append(arr2[j])
                j += 1
            }else{
                merge.append(arr1[i])
                i += 1
            }
        }
        
        if i == arr1.count {
            for index in j...arr2.count - 1{
                merge.append(arr2[index])
            }
        }else{
            for index in i...arr1.count - 1{
                merge.append(arr1[index])
            }
        }
        return merge
    }
    func mergeSortResolve<T:Comparable>(_ partArr:[T]) -> [T] {//分解
        guard partArr.count > 1 else {
            return partArr
        }
        
        if partArr.count == 2 {
            if partArr[1] >= partArr[0]{
                return partArr
            }else{
                return [partArr[1],partArr[0]]
            }
        }
        
        let mid = partArr.count / 2
        let part1 = mergeSortResolve(Array(partArr[0...mid]))
        let part2 = mergeSortResolve(Array(partArr[mid+1..<partArr.count]))
        return merge(part1, part2)
    }
    return mergeSortResolve(originalData)
}
//print(mergeSort([4,2,9,-1,0,-9,10,14,15]))
///=============================快速排序=======================================
func quickSort<T:Comparable>(_ originalData: inout [T]) {
    func quickSortResolve<T:Comparable>(_ originalData: inout [T],_ start:Int,_ end:Int) {
        if start >= end {
            return
        }
        
        let position = partition(&originalData, start, end) { (pivot, a) in
            pivot < a
        }
        
        quickSortResolve(&originalData, start, position-1)
        quickSortResolve(&originalData, position, end)
    }
    
    func partition<T:Comparable>(_ originalData:inout [T],_ start:Int,_ end:Int,by order:(_ a:T,_ b:T)->Bool) -> Int {
        var temp = originalData
        let pivot = temp[end]
        
        var endPoint = end
        var i = start
        while i < endPoint {
            if order(pivot, originalData[i]) {
                endPoint -= 1
                originalData.swapAt(i, endPoint)
            }
            else {
                i += 1
            }
        }
        
        originalData.swapAt(endPoint, end)
        return endPoint
        /*
        var i = start
        for j in start..<end {
            if order(pivot,originalData[j]){
                originalData.swapAt(i, j)
                i += 1
            }
        }
        originalData.swapAt(i, end)
        return i */
    }
    quickSortResolve(&originalData, 0, originalData.count - 1)
}

var arr = [4,2,9,-1,0,-9,10,14,15]
quickSort(&arr)
//print(arr)

///借助快速排序 找第K大的数
func findK<T:Comparable>(_ k:Int,in originalData: inout [T]) -> T {
    guard k < originalData.count else {
        fatalError("out of bound")
    }
    
    func quickSortResolve<T:Comparable>(_ originalData: inout [T],_ start:Int,_ end:Int) -> T{
        if start >= end {
            return originalData[start]
        }
        
        let position = partition(&originalData, start, end) { (pivot, a) in
            pivot < a
        }
        
        if position + 1 == k {
            return originalData[position]
        }else if position + 1 < k {
            return  quickSortResolve(&originalData, position, end)
        }else{
            return quickSortResolve(&originalData, start, position-1)
        }
    }
    
    func partition<T:Comparable>(_ originalData:inout [T],_ start:Int,_ end:Int,by order:(_ a:T,_ b:T)->Bool) -> Int {
        var temp = originalData
        let pivot = temp[end]
        var i = start
        for j in start..<end {
            if order(pivot,originalData[j]){
                originalData.swapAt(i, j)
                i += 1
            }
        }
        originalData.swapAt(i, end)
        return i
    }
    return quickSortResolve(&originalData, 0, originalData.count - 1)
}
//print(findK(1, in: &arr))
//===========================二分查找==============================================
func binarySearch<T:Comparable>(_ originalData:[T],_ destinationData:T) -> Int? {
    guard originalData.count > 0 else {
        return nil
    }
    var high = originalData.endIndex - 1
    var low = 0
    
    while low < high && originalData[high] > destinationData && originalData[low] < destinationData {
        let mid = low + (high - low ) / 2
        let midData = originalData[mid]
        if destinationData > midData{
            low = mid + 1
        }else if(destinationData < midData){
            high = mid - 1
        }else{
            return mid
        }
    }
    if originalData[high] < destinationData || destinationData < originalData[low] {
        return nil
    }else{
        return low
    }
}
//print(binarySearch([7,9,12,18,24,85], 0))
//递归二分查找
func  recursionBinarySearch<T:Comparable>(_ originalData:[T],_ destinationData:T) -> Int? {
    guard originalData.count > 0 else {
        return nil
    }
    var high = originalData.endIndex - 1
    var low = 0
        let mid = low + (high - low ) / 2
        let midData = originalData[mid]
        if destinationData > midData{
            low = mid + 1
            return recursionBinarySearch(Array(originalData[low...high]), destinationData)
        }else if(destinationData < midData){
            high = mid - 1
            return recursionBinarySearch(Array(originalData[low...high]), destinationData)
        }else{
            return mid
        }
}
print(recursionBinarySearch([7,9,12,18,24,85], 18))
