//
//  main.swift
//  Test
//
//  Created by 박형석 on 2022/01/14.
//

import Foundation

struct DoubleStackQueue<Element> {
    private var inbox: [Element] = []
    private var outbox: [Element] = []
    
    var isEmpty: Bool{
        return inbox.isEmpty && outbox.isEmpty
    }
    
    var count: Int{
        return inbox.count + outbox.count
    }
    
    var front: Element? {
        return outbox.last ?? inbox.first
    }
    
    init() { }
    
    init(_ array: [Element]) {
        self.init()
        self.inbox = array
    }
    
    mutating func enqueue(_ n: Element) {
        inbox.append(n)
    }
    
    mutating func dequeue() -> Element {
        if outbox.isEmpty {
            outbox = inbox.reversed()
            inbox.removeAll()
        }
        return outbox.removeLast()
    }
}

extension DoubleStackQueue: ExpressibleByArrayLiteral {
    init(arrayLiteral elements: Element...) {
        self.init()
        inbox = elements
    }
}

struct Point {
    var row: Int
    var col: Int
    var value = 1
    var move: [Self] {
        return [
            Point(row-1, col),
            Point(row+1, col),
            Point(row, col-1),
            Point(row, col+1)
        ]
    }
    
    init(_ row: Int, _ col: Int) {
        self.row = row
        self.col = col
    }
    
    func isInRange(r rows: Range<Int>, c cols: Range<Int>) -> Bool {
        return rows.contains(row) && cols.contains(col)
    }
}

var board = [[Int]]()
var visited = [[Bool]]()

//var maxwidth = 0
//var numberOfPicture = 0

func bfs(_ p: Point) {
    var queue = DoubleStackQueue<Point>()
    queue.enqueue(p)
    visited[p.row][p.col] = true
//    var currentWidth = 1
    
    while !queue.isEmpty {
        let currentPosition = queue.dequeue()
//        if currentWidth > maxwidth {
//            maxwidth = currentWidth
//        }
        for next in currentPosition.move where next.isInRange(r: 0..<10, c: 0..<10) {
            guard board[next.row][next.col] == 1,
                  !visited[next.row][next.col] else { continue }
            visited[next.row][next.col] = true
//            currentWidth += 1
//            var next = next
//            next.value = currentWidth
            queue.enqueue(next)
        }
    }
}

let nm = readLine()!.split(separator: " ")
let r = Int(nm[0])!
let c = Int (nm[1])!

var board1 = [[Int]]()
for _ in 0..<r {
    board1.append(readLine()!.split(separator: " ").map { Int($0)! })
}

var visited1 = Array(repeating: Array(repeating: false, count: c), count: r)

func bfs2(_ p: Point) {
    var queue = Queue<Point>()
    queue.enqueue(p)
    visited1[p.row][p.col] = true
    while !queue.isEmpty {
        let currentPosition = queue.dequeue()!
        for nextPosition in currentPosition.move where nextPosition.isInRange(r: 0..<r, c: 0..<c) {
            visited1[nextPosition.row][nextPosition.col] = true
            queue.enqueue(nextPosition)
        }
    }
}

struct Queue<T> {
    private var inbox = [T]()
    private var outbox = [T]()
    
    public var isEmpty: Bool {
        return inbox.isEmpty && outbox.isEmpty
    }
    
    public mutating func enqueue(_ element: T) {
        self.inbox.append(element)
    }
    
    public mutating func dequeue() -> T? {
        if outbox.isEmpty {
            outbox = inbox.reversed()
            inbox.removeAll()
        }
        guard !outbox.isEmpty else { return nil }
        return outbox.removeLast()
    }
}
