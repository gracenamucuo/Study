//
//  main.swift
//  LRU
//
//  Created by 戴运鹏 on 2019/2/23.
//  Copyright © 2019 戴运鹏. All rights reserved.
//

import Foundation
var node1 = LinkedListNode.init(key: "1", value: "one")

var node2 = LinkedListNode.init(key: "2", value: "two")
var node3 = LinkedListNode.init(key: "3", value: "three")

var linkList = LinkedList.init()
linkList.insertNodeAtHead(node1)
linkList.insertNodeAtHead(node2)
linkList.insertNodeAtHead(node3)
node2.value = "2222"
linkList.insertNodeAtHead(node2)
print(linkList)

let a = "123456".reversed()
for char in a {
    print(char)
}
print(a)




