//
//  Queue.swift
//  CodingTest
//
//  Created by 박형석 on 2021/08/09.
//

import Foundation

struct Queue<T> {
    private var inbox = [T]()
    private var outbox = [T]()
    
    var isEmpty: Bool {
        return inbox.isEmpty && outbox.isEmpty
    }
    
    var count: Int {
        return inbox.count + outbox.count
    }
    
    init() { }
    init(array: [T]) {
        self.init()
        self.inbox = array
    }
    
    mutating func enqueue(_ element: T) {
        inbox.append(element)
    }
    
    mutating func dequeue() -> T? {
        if outbox.isEmpty {
            outbox = inbox.reversed()
            inbox.removeAll()
        }
        guard !outbox.isEmpty else { return nil }
        return outbox.removeLast()
    }
    
}

extension Queue: ExpressibleByArrayLiteral {
    init(arrayLiteral elements: T...) {
        self.init()
        self.inbox = elements
    }
}
