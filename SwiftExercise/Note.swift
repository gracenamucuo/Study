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
//❓❓❓❓❓❓
// as! 和 as? 【as!强制转类型】
//类型后加！
//获得类的字符串名称
//闭包里引用self必须显示的使用self
//初始化类型的时候，存储属性是否需要赋值或者声明为可选类型
/*
 lazy var downloadQueue:OperationQueue = {
 let queue = OperationQueue()
 queue.name = "Download queue"
 queue.maxConcurrentOperationCount = 1
 return queue
 }()
 */
