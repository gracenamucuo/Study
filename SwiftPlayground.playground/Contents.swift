import UIKit

var str = "Hello, playground"
str = "你好 swift"
let max = 5
var a = 1,b = 2,c = 3
print(Int.max)
print(Int64.max)
var d:Int64 = 5
//var m:String
//m = "那你"    ❓❓❓Swift声明变量的时候必须要有初始值❓❓❓


//常量和变量的名字不能包含空白字符，数学符号，箭头，保留(或者无效的)Unicode码位、连线和制表符。也不能用数字开头


var helloStr:String = "hello swift"
let swift:String = "你好"
print("你好\(helloStr)")
print(helloStr + swift)
print(UInt.max)

//类型转换
let twoThousand:UInt16 = 2_000
let one:UInt8 = 1
let sum = twoThousand + UInt16(one)

//类型别名
typealias IntAlias = Int
var testInt:IntAlias = 44
let isYellow = true
if isYellow {
    print("是黄色的")
}else{
    print("不是黄色的")
}

//元组 是把多个值合并成单一复合型的值，元组内的值可以是任何类型，并且可以不是同一类型。
let http404Error = (404,"Not Found")
//分解元组
print("元组的打印\(http404Error.0)+ \(http404Error.1)")
let (statusCode,_)=http404Error
print("状态码:\(statusCode)")
//元组每个元素命名:
let http200Status = (statusCode:200,des:"OK")
print("元组元素的命名:\(http200Status.statusCode) + \(http200Status.des)")

//可选项
let possibleNum = "123"
let convertNum = Int(possibleNum)

if convertNum != nil {
    print("转为整数了\(convertNum!)")//强制解包
}

//可选项绑定

if let firstNum = Int("4"),let secondNum = Int("42"),firstNum<secondNum&&secondNum<100 {
    print("成功")
}

//隐式展开可选项
let possibleString:String? = "一个字符串"
let forcedString = possibleString!
let assumedString:String! = nil
//let implicitString:String = assumedString
if let cc = assumedString {
    print(cc)
}else{
    print("是没有值的")
}

//断言和强制先决条件
let age = -3
//assert(age > 0,"年龄不能小于0")

var index = 5
precondition(index > 0, "索引必须大于0")

//*******基本运算符********//
print("hello" + "world")//swift支持字符串用 + 拼接

let name = "world"
if name == "world" {
    print("swift可以用 == 来判断字符串是不是一样")
}

var bigger = (3,"apple")<(2,"bird")//元组以从左到右的顺序比较大小，一次一个值，直到找到两个不相等的值为止，如果所有的值都是相等的，元组本身就是相等的。【支持小于7个元素的元组】

//  a??b  可选项a有值则展开，没有值，则默然返回b，表达式a必须是一个可选类型，表达式b必须与a的存储类型相同。
let defaultColorName = "red"
var userDefinedColorName:String? = "5"
var colorNameToUse = userDefinedColorName ?? defaultColorName// ??合并空值运算符

//闭区间
for index in 1...5 {
    print("我是第\(index)个")
}

for index in 1..<5 {
    print("我是开区间的第\(index)个")
}



























































































































































































































