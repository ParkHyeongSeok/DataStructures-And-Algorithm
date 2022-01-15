//
//  BFS.swift
//  CodingTest
//
//  Created by 박형석 on 2022/01/14.
//

import Foundation

func bfs(_ p: Point) {
    var queue = Queue<Point>()
    queue.enqueue(p)
    visited[p.row][p.col] = true
    while !queue.isEmpty {
        let cp = queue.dequeue()!
        for np in cp.move where np.isInRange(0..<r, 0..<c) {
            visited[np.row][np.col] = true
            queue.enqueue(np)
        }
    }
}

// 그래프 만들기
var r = 1
var c = 1

// 그래프 입력받기
var board = [[Int]]()
//for _ in 0..<r {
//    board.append(readLine()!.split(separator: " ").map { Int($0)! })
//}

// 방문여부 -> row, col 순서 주의, false가 아닌 -1과 같은 값으로 사용해서 원하는 결과 도출할 수 있음
var visited = Array(repeating: Array(repeating: false, count: c), count: r)

// 이 좌표를 1차원 배열에서는 다르게 설정하면 되는 것
// 좌표 데이터
struct Point {
    var row: Int
    var col: Int
    var move: [Point] {
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
    
    func isInRange(_ rows: Range<Int>, _ cols: Range<Int>) -> Bool {
        return rows.contains(row) && cols.contains(col)
    }
}
