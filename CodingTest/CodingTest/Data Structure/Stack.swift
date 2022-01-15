//
//  Stack.swift
//  CodingTest
//
//  Created by 박형석 on 2021/08/09.
//

import Foundation

// 사실 append와 popLast만 가지고 배열을 스택처럼 쓸 수 있다.
// 새로운 재배열 작업도 필요없어서 O(1)의 시간 복잡도를 가지고 있다.

struct Stack<T> {
    
    private var stack = [T]()
    
    public var count: Int {
        return stack.count
    }
    
    public var isEmpty: Bool {
        return stack.isEmpty
    }
    
    public mutating func push(_ element: T) {
        stack.append(element)
    }
    
    public mutating func pop() -> T? {
        return isEmpty ? nil : stack.popLast()
    }
}

//var stack = Stack<Int>()
//stack.push(4)
//stack.push(3)
//stack.push(2)
//
//// 2가 삭제 된다.
//print(stack.pop())
