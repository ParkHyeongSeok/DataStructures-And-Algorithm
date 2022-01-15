////
////  LinkedList2.swift
////  CodingTest
////
////  Created by 박형석 on 2021/08/17.
////
//
//import Foundation
//
//class Node<T> {
//    var prev: Node?
//    var data: T?
//    var next: Node?
//    
//    init(data: T?, prev: Node? = nil, next: Node? = nil) {
//        self.prev = prev
//        self.data = data
//        self.next = next
//    }
//}
//
//class DoublyLinkedList<T: Equatable> {
//    
//    var head: Node<T>?
//    var tail: Node<T>?
//    
//    func append(_ value: T?) {
//        
//        if head == nil || tail == nil {
//            head = Node(data: value)
//            tail = head
//            return
//        }
//        
//        let newNode = Node(data: value)
//        tail?.next = newNode
//        newNode.prev = tail
//        tail = newNode
//        
//        
//    }
//    
//    func removeLast() {
//        if head == nil || tail == nil {
//            return
//        }
//        
//        if head?.next == nil {
//            head = nil
//            tail = nil
//            return
//        }
//        
//        tail?.prev?.next = tail?.next
//        tail = tail?.prev
//    }
//    
//    func searchFromHead(from value: T?) {
//        
//    }
//    
//    func searchNode(from data: T?) -> Node<T>? {
//        
//        if head == nil || tail == nil { return nil }
//        
//        var node = head
//        while node?.next != nil {
//            if node?.data == data { break }
//            node = node?.next
//        }
//        
//        return node
//    }
//    
//    func searchNodeFromTail(from data: T?) -> Node<T>? {
//        
//        if head == nil || tail == nil { return nil }
//        
//        var node = tail
//        while node?.prev != nil {
//            if node?.data == data { break }
//            node = node?.prev
//        }
//        
//        return node
//    }
//
//
//    
//    
//}
