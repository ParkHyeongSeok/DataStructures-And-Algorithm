//
//  QueueExample.swift
//  CodingTest
//
//  Created by 박형석 on 2022/01/14.
//

import Foundation

struct Queue<T: Equatable> {
    private var array = [T]()
    
    public var currentQueue: [T] {
        return array
    }
    
    public func contains(_ element: T) -> Bool {
        return array.contains(element)
    }
    
    public var isEmpty: Bool {
        return array.isEmpty
    }
    
    public mutating func enqueue(_ element: [T]) {
        array += element
    }
    
    public mutating func dequeue() -> T? {
        if array.isEmpty {
            return nil
        } else {
            return array.removeFirst()
        }
    }
}

func BFStest(_ graph: [String:[String]], start: String) -> [String] {
    var visitedQueue = Queue<String>()
    var neededQueue = Queue<String>()
    neededQueue.enqueue([start])
    
    while let node = neededQueue.dequeue() {
        if visitedQueue.contains(node) {
            continue
        }
        visitedQueue.enqueue([node])
        neededQueue.enqueue(graph[node] ?? [])
    }
    return visitedQueue.currentQueue
}
