////
////  LinkedList.swift
////  CodingTest
////
////  Created by 박형석 on 2021/08/17.
////
//
//import Foundation
//
//// 배열  = 인덱스O, 인덱스를 알면 값에 대한 접근이 상수 / 마지막이 아닌 요소를 삽입 삭제 => 재배치 => 오버헤드 = 느림, 크기가 고정, 검색도 순차적으로 해야 함 = 느림
//// 링크드리스트 = 인덱스X, 데이터에 접근하기 위해서 첫 번재 데이터부터 순차적으로 찾아가야 함 = 검색, 및 데이터 접근이 느림, 연결정보를 저장하는 별도의 데이터공간이 필요 저장공감 효율 낮음 / 삽입, 삭제 속도가 빠름
//
//class Node1<T: Equatable> {
//    var data: T?
//    var next: Node?
//    
//    init(data: T?, next: Node? = nil) {
//        self.data = data
//        self.next = next
//    }
//}
//
//class LinkedList<T: Equatable> {
//    
//    private var head: Node<T>?
//    
//    func append(_ value: T?) {
//        if head == nil {
//            head = Node(data: value, next: nil)
//            return
//        }
//        var node = head
//        while node?.next != nil {
//            node = node?.next
//        }
//        node?.next = Node(data: value)
//    }
//    
//    func insert(_ value: T?, at index: Int) {
//        if head == nil {
//            head = Node(data: value)
//            return
//        }
//        var node = head
//        for _ in 0..<index-1 {
//            if node?.next == nil {
//                break
//            }
//            node = node?.next
//        }
//        
//        let nextNode = node?.next
//        node?.next = Node(data: value)
//        node?.next?.next = nextNode
//    }
//    
//    func removeLast() {
//        if head == nil { return }
//        
//        if head?.next == nil {
//            head = nil
//        }
//        
//        var node = head
//        while node?.next?.next != nil {
//            node = node?.next
//        }
//        node?.next = node?.next?.next
//    }
//    
//    func remove(at index: Int) {
//        if head == nil { return }
//        if index == 0 || head?.next == nil {
//            head = head?.next
//            return
//        }
//        var node = head
//        for _ in 0..<index-1 {
//            if node?.next?.next == nil { break }
//            node = node?.next
//        }
//        node?.next = node?.next?.next
//    }
//    
//    func search(from value: T?) -> Node<T>? {
//        if head == nil { return nil }
//        
//        var node = head
//        
//        while node?.next != nil {
//            if node?.data == value {
//                break
//            }
//            node = node?.next
//        }
//        
//        return node
//    }
//    
//}
