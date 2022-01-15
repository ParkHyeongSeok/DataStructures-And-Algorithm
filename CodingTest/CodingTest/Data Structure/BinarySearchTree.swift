//
//  BinarySearchTree.swift
//  CodingTest
//
//  Created by 박형석 on 2021/08/17.
//

import Foundation

// 이진탐색트리 : 자료구조이기도 하면서 알고리즘이기도 한?
// 이진트리
// + 모든 노드가 자신의 왼쪽 자식노드에는 자신보다 작은 값이 오른쪽에는 자신보다 큰 값이 들어간다.
// + 노드의 데이터는 유일하다. 중복되는 값 안돼!
// + 노드의 데이터 값은 항상 존재한다.

class Node<T: Comparable> {
    var data: T
    var left: Node?
    var right: Node?
    init(data: T, left: Node? = nil, right: Node? = nil) {
        self.data = data
        self.left = left
        self.right = right
    }
}

class BinarySearchTree<T: Comparable> {
    
    var root: Node<T>?
    
    func insert(_ data: T) {
        
        guard let root = self.root else { return self.root = Node(data: data) }
        
        var currentNode = root
        
        while true {
            if currentNode.data > data {
                guard let nextNode = currentNode.left else {
                    return currentNode.left = Node(data: data)
                }
                currentNode = nextNode
            } else {
                guard let nextNode = currentNode.right else {
                    return currentNode.right = Node(data: data)
                }
                currentNode = nextNode
            }
        }
    }
    
    func search(from data: T) -> Bool {
        if root == nil { return false }
        
        var currentNode = root
        
        while let node = currentNode {
            if node.data == data {
                return true
            }
            if node.data > data {
                currentNode = node.left
            } else {
                currentNode = node.right
            }
        }
        return false
    }
    
    
    
    func drawDiagram() {
        print(diagram(for: self.root))
    }
     
    private func diagram(for node: Node<T>?,
                         _ top: String = "",
                         _ root: String = "",
                         _ bottom: String = "") -> String {
       guard let node = node else {
            return root + "nil\n"
        }
        if node.left == nil && node.right == nil {
            return root + "\(node.data)\n"
        }
        return diagram(for: node.right, top + " ", top + "┌──", top + "│ ")
            + root + "\(node.data)\n"
            + diagram(for: node.left, bottom + "│ ", bottom + "└──", bottom + " ")
    }
    
}
