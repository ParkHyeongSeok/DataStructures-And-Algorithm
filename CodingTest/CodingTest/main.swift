//
//  main.swift
//  CodingTest
//
//  Created by 박형석 on 2021/08/09.
//

import Foundation

// 100,000
let N = Int(readLine()!)!

// 10억
let D = readLine()!.components(separatedBy: " ").map { Int($0)! }

// 10억
let P = readLine()!.components(separatedBy: " ").map { Int($0)! }

// 처음은 자기가 가야 하는 거리만큼 넣어야 한다. 최소 / 자기보다 작은 가격의 P를 보기 전까지

var totalPrice = 0
var currentPrice = 0

for i in 0..<N-1 {
    if i == 0 {
        currentPrice = P[0]
        totalPrice += currentPrice * D[0]
    } else {
        if currentPrice > P[i] {
            currentPrice = P[i]
            totalPrice += currentPrice * D[i]
        } else {
            totalPrice += currentPrice * D[i]
        }
    }
}

print(totalPrice)
