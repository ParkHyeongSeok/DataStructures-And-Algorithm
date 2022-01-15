//
//  Greedy.swift
//  CodingTest
//
//  Created by 박형석 on 2021/08/09.
//

import Foundation

// 딱 정해져 있는 어떤 알고리즘이 아니다...
// 매 순간 최적의 해라고 생각되는 것을 선택해 가는 방법으로 해를 구하는 것
// 탐욕 선택 조건은 현재의 선택이 이후의 선택에 영향을 주면 안된다. 그리고 작은 문제로 쪼갰을 때 그 부분에서 최적의 해가 되도록 해야 한다.
// 뭔가 그냥 제일 좋은 방법에 대한 아이디어를 찾아 최적인지 확인하고 풀면되는 듯...?

func solution(n: Int, lost: [Int], reserve: [Int]) -> Int {
//
//    var nonConection = 0
//
//    var newReverse = reverses
//    var newLost = lost.filter { (lostNum) -> Bool in
//        for i in 0..<newReverse.count {
//            if newReverse[i] == lostNum {
//                newReverse.remove(at: i)
//                return false
//            }
//        }
//        return true
//    }
//
//    for loster in newLost {
//        for i in 0..<newReverse.count {
//
//            if loster == newReverse[i] - 1 || loster == newReverse[i] + 1 {
//                newReverse.remove(at: i)
//            } else {
//                nonConection += 1
//            }
//        }
//    }
//
//    // 전체 학생 수 - 체육 수업을 못듣는 사람 수
//    return n - nonConection
    
    // Set을 사용하면 차집합이 가능하다. 또 해당 값을 바로 삭제 할 수 있다.
    var lostSet = Set(lost).subtracting(reserve)
    let reserveSet = Set(reserve).subtracting(lost)
    
    for reserve in reserveSet {
        if lostSet.contains(reserve-1) {
            lostSet.remove(reserve-1)
            continue
        }
        if lostSet.contains(reserve+1) {
            lostSet.remove(reserve+1)
        }
    }
    
    // 남은 set의 수에 전체 학생 수를 빼주자.
    return n - lostSet.count
}

