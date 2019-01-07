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

let b = 4

let match = ["john","rose","xiaoming"].last { (a) -> Bool in
    a.hasSuffix("n")
}
print(match)
print(arr.last {$0 % 2 == 1})

extension Array{
    func accumulate<Result>(_ initialResult:Result, _ nextPartialResult:(Result,Element)->Result) -> [Result] {
        var running = initialResult
        return map({ (next) in
            running = nextPartialResult(running,next)
            return running
        })
    }
}

print([1,4,6,7].accumulate(0, +))

let nums = [1,2,3,4,5,6,7,8]
print(nums.filter({ (num) -> Bool in
    num % 2 == 0
}))

//--
(1..<10).map {$0 * $0}.filter {$0 % 2 == 0}

extension Array{
    func filter(_ isIncluded:(Element)->Bool) -> [Element] {
        var result:[Element] = []
        for x in self where isIncluded(x) {
            result.append(x)
        }
        return result
    }
}

[1,3,7,9].contains { (n) -> Bool in//contains函数 返回true时就返回，如果一直返回false，会便利序列中的所有元素
    print("--")
   return n % 2 == 0
}



extension Sequence{
    
    func all(matching predicate:(Iterator.Element)->Bool) -> Bool {
        return !contains(where: {!predicate($0)})//负负得正 对于一个条件，如果没有元素不满足的话，就说明所有元素都满足。
    }
}
print([1,3,5,7].all{ $0%2 == 1 })


print([1,2,3,4,5].reduce(0, +))

extension Array{//
    func reduce<Result>(_ initialResult:Result,_ nextPartialResult:(Result,Element)->Result) -> Result {
        var result = initialResult
        for x in self {
            result = nextPartialResult(result,x)
        }
        return result
    }
}

let custom_reduce = ["h","e","l","l","o"].reduce("") { (initial, element)in
    initial + element
}
print(custom_reduce)

extension Array{
    func flatMap<T>(_ transform:(Element)->[T]) -> [T] {
        var result:[T] = []
        for x in self {
            result.append(contentsOf: transform(x))
        }
        return result
    }
}

let ranks = ["J","Q","K","A"]
let suits = ["♣️","♥️","♦️","♠️"]
let result = suits.flatMap { suit  in
    ranks.map({ (rank)  in
        (suit,rank)
    })
}
print(result)

//=====================================【【【【字典】】】】==============================================

extension Dictionary{
   mutating func merge<S>(_ other:S)where S:Sequence,S.Iterator.Element == (key:Key,value:Value) {
    for (k,v) in other {
        self[k] = v
    }
    }
}
extension Dictionary{
    init<S:Sequence>(_ sequence:S) where S.Iterator.Element == (key:Key,value:Value) {
        self = [:]
        self.merge(sequence)
    }
}
let dic = Dictionary.init([(key:"1",value:"one")])

///hashable
struct Person {
    var name:String
    var zipCode:Int
    var birthday:Date
}

extension Person:Equatable{
   static func ==(lhs:Person,rhs:Person) -> Bool {
        return lhs.name == rhs.name && lhs.zipCode == rhs.zipCode && lhs.birthday == rhs.birthday
    }
}

extension Person:Hashable
{
    var hashVlaue:Int{
        return name.hashValue ^ zipCode.hashValue ^ birthday.hashValue
    }
}
///======================================【【【【Set】】】】=======================================

///======================================【【【【Sequence 序列 是协议】】】】=======================================
//遵循Sequence协议需要实现返回迭代器makeIterator()->Iterator【遵循IteratorProtocol协议:该协议需要实现一个next方法】
struct FibsIterator:IteratorProtocol {
    var state = (0,1)
   mutating func next() -> Int? {
    let upcomingNum = state.0
    state = (state.1,state.0 + state.1)
    return upcomingNum
    }
}

struct PrefixIteraror:IteratorProtocol {
    let string:String
    var offset:String.Index
    init(string:String) {
        self.string = string
        offset = string.startIndex
    }
    
    mutating func next() -> String? {
        guard offset < string.endIndex else {
            return nil
        }
        offset = string.index(after: offset)
        return String(string[string.startIndex..<offset])
    }
    
}

struct PrefixSequence:Sequence {
    let string:String
    func makeIterator() -> PrefixIteraror {
        return PrefixIteraror(string: string)
    }
}

for prefix in PrefixSequence(string: "Hello"){
    print(prefix)
}

print("=====")

//=======================================【【【【Collection集合类型】】】】================================

protocol Queue {
    associatedtype Element
   mutating func enqueue(_ newElement:Element)
   mutating func dequeue()->Element?
}

struct FIFOQueue<Element>:Queue {
    var left:[Element] = []
    var right:[Element] = []
   mutating func enqueue(_ newElement: Element) {
        right.append(newElement)
    }
    
   mutating func dequeue() -> Element? {
    if left.isEmpty {
        left = right.reversed()
        right.removeAll()
    }
    return left.popLast()
    }
    
}

extension FIFOQueue:Collection
{
    var startIndex: Int{return 0}
    var endIndex:Int {return left.count + right.count}
    func index(after i: Int) -> Int {
        precondition(i < endIndex)
        return i + 1
    }
    
    subscript(position:Int)->Element{
        precondition((0..<endIndex).contains(position),"index out of bounds")
        if position < left.endIndex{
            return left[left.count - position - 1]
        }else{
            return right[position - left.count]
        }
    }
}

extension FIFOQueue:ExpressibleByArrayLiteral
{
    init(arrayLiteral elements:Element...) {
        self.init(left: elements.reversed(), right: [])
    }
}


//====================================【【【【【链表】】】】】===================================

enum List<Element> {
    case end
    indirect case node(Element,next:List<Element>)
}

print("====")
