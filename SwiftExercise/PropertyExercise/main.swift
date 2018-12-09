//
//  main.swift
//  PropertyExercise
//
//  Created by 戴运鹏 on 2018/11/17.
//  Copyright © 2018 戴运鹏. All rights reserved.
//

import Foundation

struct Point {
    var x = 0.0,y = 0.0
}

struct Size {
    var width = 0.0,height = 0.0
}

struct Rect {
    var origin = Point()
    var size = Size()
    var center:Point{
        get{
            let centerX = origin.x + size.width / 2
            let centerY = origin.y + size.height / 2
            return Point.init(x: centerX, y: centerY)
            
        }
        set(newCenter){
            origin.x = newCenter.x - size.width / 2
            origin.y = newCenter.y - size.height / 2
        }
    }
}

var square = Rect.init(origin: Point.init(x: 0, y: 0), size: Size(width: 10.0, height: 10.0))

let initialSquareCenter = square.center
square.center = Point(x: 15, y: 15)
//简写属性的setter方法
struct AlternativeRect {
    var origin = Point()
    var size = Size()
    var center:Point {
        get{
            let centerX = origin.x + size.width / 2
            let centerY = origin.y + size.height / 2
            return Point(x: centerX, y: centerY)
            
        }
        set{
            origin.x = newValue.x - size.width / 2
            origin.y = newValue.y - size.height / 2
        }
    }
}
//只读计算属性
struct Cuboid {
    var width = 0.0,height = 0.0,depth = 0.0
    var volume:Double{
        return width * height * depth
    }
    
}

//属性观察者
class StepCounter {
    var totalSteps:Int = 0{
        willSet(newTotalSteps){
            print("设置新值")
        }
        didSet{
            if totalSteps > oldValue {
                print("大于")
            }
        }
    }
    
}

var step = StepCounter()
step.totalSteps = 100

struct PointMutat {
    var x = 0.0,y = 0.0
    mutating func moveBy(x deltaX:Double,y deltaY:Double) {
        x += deltaX
        y += deltaY
    }
}
var somePoint = PointMutat(x: 1.0, y: 1.0)
somePoint.moveBy(x: 2.0, y: 3.0)

//枚举的异变方法可以设置隐含的self属性为相同枚举里的不同成员

enum TriStateSwitch {
    case off,low,high
    mutating func next() {
        switch self {
        case .off:
            self = .low
        case .low:
            self = .high
        case .high:
            self = .off
        }
    }
}

//下标
struct TimesTable {
    let multiplier:Int
    subscript(index:Int)->Int
    {
        return multiplier * index
    }
}

class Vehicle {
    var currentSpeed = 0.0
    var description:String {
        return "at \(self.currentSpeed) miles per hour"
    }
}

class Car: Vehicle {
    var gear = 1
    override var description: String {
        return super.description + "in grar \(self.gear)"
    }
    
    
}




































