//
//  Note.swift
//  SwiftExercise
//
//  Created by 戴运鹏 on 2018/12/9.
//  Copyright © 2018 戴运鹏. All rights reserved.
//

import Foundation
//扩展中不能添加存储属性
//作为选择子#selector()的方法，需要在前边加上@objc
//使用自定义字体的时候，需要将字体加入到plist文件中 key是Fonts provided by application
//直接在tableView上画的cell 直接用在storyoboard中注册就好
//Data(contentsOf:url!)是可以下载图片的
//调用带有throws关键字的函数的话，最好写在do{}catch{}里
//❓❓❓❓❓❓
// as! 和 as? 【as!强制转类型】
//✅is来检测一个实例是否属于一个类的子类。类似于OC的isKindOfClass
//✅as? 向下转换类型 if let movie = item as? Movie{}
//✅as! 强制向下转换

//✅类型后加！为隐式展开可选项 隐式展开可选项可以直接赋值给一个非可选项类型，可选项需要可选绑定或者用三目运算符 ？？ 给定一个默认值
//✅获得类的字符串名称 String(describing: UITableViewCell.self)
//✅闭包里引用self必须显示的使用self
//✅struct没有便利构造方法  只有类有便利初始化器和便利初始化器

//可选项
let name:String? = "1"
//隐式展开可选项
let age:String!  //两者都可以用可选项绑定
if let unwrapped_name = name {//可选项绑定
    print(unwrap_name.self,name.self)
}

var unwrappedName = name ?? "默认值" //也可以用三目运算符


//✅可选链：调用和查询可选属性、方法和下标的过程，可能为nil  可选链调用返回的是可选值
//john.residence?.address?.street 可选链
//if let johnStreet = john.residence?.address?.street{
    //也可以用可选项绑定
//}


/*
 lazy var downloadQueue:OperationQueue = {
 let queue = OperationQueue()
 queue.name = "Download queue"
 queue.maxConcurrentOperationCount = 1
 return queue
 }()
 */


// ======之前==
//**1，尾缀 -ed 表示过去式，-ing 表示名称:有返回值，不影响原对象。**
//
//**2，没有这些尾缀，则为动作，直接作用于原对象。**
//
//---
//
//
//###两段式初始化过程的四种安全检查
//**两段式初始化**第一个阶段，每一个存储属性被引入类为其分配了一个初始值。一旦每个存储属性的初始状态被确定，第二个阶段开始，每个类都有机会在新的实例准备使用之前来制定它的存储属性。
//* 指定初始化器必须保证在向上委托给父类初始化器之前，其所在类引入的所有属性都要初始化完成。
//* 指定初始化器必须先向上委托父类初始化器，然后才能为继承的属性设置新值。如果不这样，指定初始化器赋予的新值将被父类中的初始化器所覆盖。
//* 便捷初始化器必须先委托同类中的其他初始化器，然后再为任意属性赋新值，（包括同类里定义的属性）。如果不这样，便利构造器赋予的新值将被自己类中其他初始化器所覆盖。
//* 初始化器在第一阶段初始化完成之前，不能调用任何实例方法，不能读取任何实例属性的值，也不能引用self作为值。
//*

==========================================================================================================================================================
