//
//  LinkedList.swift
//  LRU
//
//  Created by 戴运鹏 on 2019/2/23.
//  Copyright © 2019 戴运鹏. All rights reserved.
//

import Foundation
class LinkedList {
    fileprivate var mutableDic = [String:Any]()
    var head:LinkedListNode?
    var tail:LinkedListNode?
    func insertNodeAtHead(_ node:LinkedListNode) {
        mutableDic[node.key] = node.value
        if head != nil {
            node.next = head
            head?.prev = node
            head = node
        }else{
            head = node
            tail = node
        }
    }
    
    func bringNodeToHead(_ node:LinkedListNode) {
        if head != nil {
            if head! === node{return}
        }
        
        if tail != nil {
            if tail! === node{
               tail = node.prev
                tail?.next = nil
            }else{
                node.next?.prev = node.prev
                node.prev?.next = node.next
            }
            node.next = head!
            node.prev = nil
            head?.prev = node
            head = node
        }
    }
    
    func removeNode(_ node:LinkedListNode) {
     mutableDic.removeValue(forKey: node.key)
        if node.next != nil {
            node.next?.prev = node.prev
        }
        
        if node.prev != nil {
            node.prev?.next = node.next
        }
        
        if node === head {
            head = node.next
        }
        
        if node === tail {
            tail = node.prev
        }
        
    }
    
    func removeTailNode() -> LinkedListNode? {
        if tail == nil {
            return nil
        }
        let t = tail
        if head === tail {
            head = nil
            tail = nil
        }else{
            tail = tail?.prev
            tail?.next = nil
        }
        return t
    }
    
    func removeAll() {
        head = nil
        tail = nil
        if mutableDic.count > 0 {
            mutableDic.removeAll()
        }
    }
}

class LinkedListNode {
    var prev:LinkedListNode?
    var next:LinkedListNode?
    var key:String
    var value:Any
    init(key:String,value:Any) {
        self.key = key
        self.value = value
    }
}

