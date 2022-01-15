////
////  Queue.swift
////  CodingTest
////
////  Created by 박형석 on 2021/08/09.
////
//
//import Foundation
//
//struct Queue<T> {
//
//    private var queue = [T?]()
//    private var head: Int = 0
//
//    public var isEmpty: Bool {
//        return queue.isEmpty
//    }
//
//    public var count: Int {
//        return queue.count
//    }
//
//    public mutating func enqueue(_ element: T) {
//        // insert는 O(N)이지만, append는 O(1)이다. 배열이 재배열하는 과정이 없기 때문이다. 이건 삭제도 마찬가지다. 특정 배열의 요소를 삭제하면 그 뒤에 있는 친구들도 재배열된다.
//        queue.append(element)
//    }
//
//    // 그래서 삭제시에는 다음과 같이 구현하면 시간 복잡도 O(1)의 큐를 만들 수 있다.
//    public mutating func dequeue() -> T? {
//
//        // head(index)가 count보다 크거나 같은 경우, 모든 배열이 비워지기 때문에 nil을 반환
//        // 리턴 값은 미리 할당한 후에 리턴
//        guard head < queue.count, let element = queue[head] else { return nil }
//
//        // 해당 헤드를 비워주고
//        queue[head] = nil
//
//        // 다음으로 헤드를 옮겨줌
//        head += 1
//
//        // 50개 이상 nil이 축적되었을 때 비워주기. 물론 이 방식은 다양하게 구현이 가능하다.
//        if head > 50 {
//            queue.removeFirst(head)
//            head = 0
//        }
//
//        // 삭제된 요소 리턴
//        return element
//    }
//}
//
////var queue = Queue<Int>()
////
////queue.enqueue(3)
////queue.enqueue(4)
////queue.enqueue(5)
//
//// 3이 먼저 삭제되고, 모두 삭제되었을 시
////print(queue.dequeue())
////print(queue.dequeue())
////print(queue.dequeue())
////print(queue.dequeue())
