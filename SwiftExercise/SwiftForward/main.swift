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
    indirect case node(Element,next:List<Element>)//indirect告诉编译器该枚举值应该被看做引用
}

extension List
{
    func cons(_ x:Element) -> List {
        return .node(x,next:self)
    }
}

extension List : ExpressibleByArrayLiteral
{
    init(arrayLiteral elements: Element...) {
        self = elements.reversed().reduce(.end, { (partialList, element) in
            partialList.cons(element)
        })
    }
}
let list:List = [3,2,1]

//====================================【【【【栈】】】】】=========================================================

protocol Stack {
    associatedtype Element
    mutating func push(_ x:Element)
    mutating func pop() -> Element?
}

extension Array:Stack
{
   mutating func push(_ x: Element) {
        append(x)
    }
    
   mutating func pop() -> Element? {
        return popLast()
    }
}

extension List:Stack{
   mutating func push(_ x: Element) {
        self = self.cons(x)
    }
    
   mutating func pop() -> Element? {
        switch self {
        case .end:
            return nil
        case let .node(x, next: xs):
            self = xs
            return x
        }
    }
}

extension List:IteratorProtocol,Sequence
{
    mutating func next() -> Element? {
        return pop()
    }
}


fileprivate enum ListNode<Element> {
    case end
   indirect case node(Element,next:ListNode<Element>)
    func cons(_ x:Element) -> ListNode<Element> {
        return .node(x,next:self)
    }
}

public struct ListIndex<Element>:CustomStringConvertible {
   fileprivate let node:ListNode<Element>
   fileprivate let tag:Int
   public var description: String{
        return "ListIndex\(tag)"
    }
}

extension ListIndex:Comparable
{
    public static func == <T>(lhs:ListIndex<T>,rhs:ListIndex<T>) -> Bool {
        return lhs.tag == rhs.tag
    }
    public static func < <T>(lhs:ListIndex<T>,rhs:ListIndex<T>) -> Bool {
    return lhs.tag > rhs.tag
    }
}

public struct ListType<Element>:Collection {
    public typealias Index = ListIndex<Element>
    public let startIndex: Index
    public let endIndex: Index
    public subscript(position:Index) -> Element{
        switch position.node{
        case .end:fatalError("Subscript out of range")
        case let .node(x,_):return x
        }
    }
   public func index(after idx:Index) -> Index {
    switch idx.node {
    case .end:fatalError("Out of range")
    case let .node(_,next):return Index(node: next, tag: idx.tag - 1)
    }
    }
}

extension ListType:ExpressibleByArrayLiteral
{
    public init(arrayLiteral elements: Element...) {
        startIndex = ListIndex(node: elements.reversed().reduce(.end, { part, element  in
            part.cons(element)
        }), tag: elements.count)
        endIndex = ListIndex(node: .end, tag: 0)
    }
}

extension ListType:CustomStringConvertible{
    public var description: String
    {
        let elements = self.map {String(describing: $0)}.joined(separator: ",")
        return "List:\(elements)"
    }
}

extension ListType{
   public var count:Int{
        return startIndex.tag - endIndex.tag
    }
}

///===============================【【【【可选值】】】】================================


let strs = ["1","2","three"]
let maybeInts = strs.map {Int($0)}

for mayInt  in maybeInts
{
    if let value = mayInt{
        print(value)
    }
}

for case let i? in maybeInts{
    print(i)
}
for case let .some(i) in maybeInts{
    print(i)
}

func unimplemented() -> Never {
    fatalError("wait a moment")
}

extension Array{
    subscript(safe idx:Int)->Element?{
        return idx < endIndex ? self[idx] : nil
    }
}
var arr0 = [1,3,4]

let characters:[Character] = []
let first = characters.first.map {String($0)}
print(first ?? 0)

extension Optional{
    func map<U>(transform:(Wrapped)->U) -> U? {
        if let value = self {
            return transform(value)
        }
        return nil
    }
}

//不接受初始值的reduce
extension Array{
    func reduce1(_ nextPartialResult:(Element,Element)->Element) -> Element? {
        guard let fst = first else {
            return nil
        }
        return dropFirst().reduce(fst, nextPartialResult)
    }
}

extension Optional{
    func flatMap<U>(transform:(Wrapped)->U?) -> U? {
        if let value = self,let transformed = transform(value) {
            return transformed
        }
        return nil
    }
}

func ==<T:Equatable>(lhs:T?,rhs:T?) -> Bool {
    switch (lhs,rhs) {
    case (nil,nil):return true
    case let (x?,y?):return x==y
    case (_?,nil),(nil,_?):return false
    }
}

print("====")
/* 迭代器
var mutableArray:Array = [1,2,3]
for _ in mutableArray
{
    print("移除了几次")
    mutableArray.removeAll()
//    print("移除了几次")
}

print("数组移除\(mutableArray)")

var iterator = mutableArray.makeIterator()
var ite1 = iterator
//while let element = iterator.next()
//{
//    print("打印\(mutableArray)")
//    mutableArray.removeLastObject()
//}
//
//while let element = ite1.next()
//{
//    print("打印\(mutableArray)")
//    mutableArray.removeLastObject()
//}

//print(iterator.next())
//print(iterator.next())
var ite2 = iterator
var i = 0

//for _ in mutableArray
//{
//    mutableArray.removeAllObjects()
//     ite2 = mutableArray.makeIterator()
//    i += 1
//    if i == 3 {
//     break
//    }
//}
var arr3:[Int] = [1,2,3]
var ite3 = arr.makeIterator()


//while  ite2.next() != nil
//{
////    arr3.removeAll()
//    mutableArray.removeAllObjects()
////    mutableArray.removeLastObject()
//    print("==========")
//}
//print("保存状态===\(ite2.next())")

*/
struct Point {
    var x:Double
    var y:Double
    
    
}

struct Rectangle {
    var width:Double
    var length:Double
    var origin:Point
    
}

extension Rectangle{
    init(size:CGSize,point:Point) {
        width = Double(size.width)
        length = Double(size.height)
        origin = point
    }
}

var rect = Rectangle.init(width: 40, length: 40, origin: Point(x: 0, y: 0)){
    didSet{
        print("我被设置了")
    }
}
rect.length = 4
rect.origin.x = 5

var rects = [rect]{
    didSet{
        print("数组变动了")
    }
}
rects[0].origin.y = 9//加到数组里了，就不能再用原来的变量rect了，因为是结构体，是值类型，装到数组中的时候，在需要的时候就会复制一份。

var input:[UInt8] = [0x0b,0xad,0xf0,0x0d]
var other:[UInt8] = [0x0d]
var d = Data(bytes: input)//Data是值类型
var e = d
d.append(contentsOf: other)
print(d,e)

var f = NSMutableData(bytes: &input, length: input.count)
var g = f
f.append(&other, length: other.count)
print(f,g)
//=======================写时复制=========
//非
struct MyData {
    var _data:NSMutableData
    init(_ data:NSData) {
        self._data = data.mutableCopy() as! NSMutableData
    }
}

let theData = NSData(base64Encoded: "wAEP/w==", options: [])!
let x = MyData(theData)
let y = x
print(x._data === y._data)//true
//高效
class Son {
   var name:String
    init(name:String) {
        self.name = name
    }
}

var p = Son.init(name: "son")
print(isKnownUniquelyReferenced(&p))

final class Box<A> {
    var unBox:A
    init(_ value:A) {
        self.unBox = value
    }
}

var box = Box(NSMutableData())
print(isKnownUniquelyReferenced(&box))//true
var box1 = box
print(isKnownUniquelyReferenced(&box))//false

struct MyCopyData {
    fileprivate var _data:Box<NSMutableData>
    var _dataForWriting:NSMutableData{
       mutating get{
        if !isKnownUniquelyReferenced(&_data) {
            _data = Box(_data.unBox.mutableCopy() as! NSMutableData)
            print("Making a copy")
        }
        return _data.unBox
        }
    }
    init(_ data:NSData) {
        self._data = Box(data.mutableCopy() as! NSMutableData)
    }
}

extension MyCopyData{
   mutating func append(_ other:MyCopyData){
        _dataForWriting.append(other._data.unBox as Data)
    }
}
let someBytes = MyCopyData(NSData(base64Encoded: "wAEP/w==", options: [])!)
var empty = MyCopyData(NSData())
var emptyCopy  = empty
for _ in 0..<5 {
    empty.append(someBytes)
}

print(empty,emptyCopy)

//=========================闭包====================
print("闭包=======================")
var i = 0
func uniqueInteger() -> Int {
    i += 1
    return i
}

uniqueInteger()
uniqueInteger()
print(uniqueInteger())

let otherFunction = uniqueInteger
otherFunction()
print(otherFunction())

func uniqueIntegerProvider() -> ()->Int {
    var i = 0
    return {
        i += 1
        return i
    }
}

let pro1 = uniqueIntegerProvider()
pro1()
pro1()
pro1()
print(pro1())
let pro2 = uniqueIntegerProvider()
print(pro2())

//let doublerAlt = {(i:Int)-> Int in return i * 2}

final class Father: NSObject {
    @objc var first:String
    @objc var last:String
     var yearOfBirth:Int
    init(first:String,last:String,yearOfBirth:Int) {
        self.first = first
        self.last = last
        self.yearOfBirth = yearOfBirth
    }
}

let people = [Father(first: "Jo", last: "Smith", yearOfBirth: 1970),
Father(first: "Joe", last: "Smith", yearOfBirth: 1970),
Father(first: "Joe", last: "Smyth", yearOfBirth: 1970),
Father(first: "Joanne", last: "smith", yearOfBirth: 1985),
Father(first: "Joanne", last: "smith", yearOfBirth: 1970),
Father(first: "Robert", last: "Jones", yearOfBirth: 1970),]

//OC写法
let lastDescriptor = NSSortDescriptor(key: #keyPath(Father.last), ascending: true, selector: #selector(NSString.localizedCaseInsensitiveCompare(_:)))
let firstDescriptor = NSSortDescriptor(key: #keyPath(Father.first), ascending: true, selector: #selector(NSString.localizedCaseInsensitiveCompare(_:)))
//let yearDescriptor = NSSortDescriptor(key: #keyPath(Father.yearOfBirth), ascending: true)

//let descriptors = [lastDescriptor,firstDescriptor,yearDescriptor]
//(people as NSArray).sortedArray(using: descriptors)
//Swift 函数作为数据

typealias SortDescriptor<Value> = (Value,Value)->Bool

func sortDescriptor<Value,Key>(key:@escaping (Value)->Key,ascending:Bool=true,_ comparator:@escaping(Key)->(Key)->ComparisonResult) -> SortDescriptor<Value> {
    return { lhs,rhs in
        let order:ComparisonResult = ascending ?.orderedAscending:.orderedDescending
        return comparator(key(lhs))(key(rhs)) == order
    }
}

let sortByFirstName:SortDescriptor<Father> = sortDescriptor(key: {$0.first}, String.localizedCaseInsensitiveCompare)
let sortByLastName:SortDescriptor<Father> = sortDescriptor(key: {$0.last}, String.localizedCaseInsensitiveCompare)
//let sortByYear:SortDescriptor<Father> = sortDescriptor(key: {(f:Father) -> Int in return f.yearOfBirth }) { (h) -> ComparisonResult in
//    return .orderedAscending
//}
people.sorted(by: sortByFirstName)

func combine<Value>(sortDescriptors:[SortDescriptor<Value>]) -> SortDescriptor<Value> {
    return {lhs,rhs in
        for areInIncreasingOrder in sortDescriptors {
            if areInIncreasingOrder(lhs,rhs){return true}
            if areInIncreasingOrder(rhs,lhs){return false}
        }
        return false
    }
}
//let combined:SortDescriptor<Father> = combine(sortDescriptors: <#T##[(Value, Value) -> Bool]#>)

























