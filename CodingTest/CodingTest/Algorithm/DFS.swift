//
//  DFS.swift
//  CodingTest
//
//  Created by 박형석 on 2022/01/15.
//

import Foundation

var dfsVisited = Array(repeating: Array(repeating: false, count: c), count: r)

func dfs(_ p: Point) {
    var stack = Stack<Point>()
    stack.push(p)
    dfsVisited[p.row][p.col] = true
    while !stack.isEmpty {
        let cp = stack.pop()!
        for np in cp.move where np.isInRange(0..<r, 0..<c) {
            dfsVisited[p.row][p.col] = true
            stack.push(np)
        }
    }
}
