//
//  BinarySearch.swift
//  CodingTest
//
//  Created by 박형석 on 2021/08/12.
//

import Foundation

enum BinarySearch {
    
    // 순차탐색 : 리스트 안에 있는 특정한 데이터를 찾기 위해 앞에서부터 하나씩 확인하는 방법
    // ex) 선택정렬 할 때 순차 탐색을 한다. 기본적으로 별말이 없다면 순차 탐색!
    
    // 이진탐색: '정렬되어 있는 리스트'(조건)에서 탐색 범위를 절반씩 좁혀가며 데이터를 탐색하는 방법, 시작점, 끝점, 중간점을 이용(3가지 변수를 이용)하여 탐색 범위를 설정한다. O(LogN) 보장 최대 O(log2N)
    
    struct 이진탐색 {
        
        // 예시. 이미 정렬된 10개의 데이터 중에서 값이 4인 원소를 찾는 예시
        
        var arr = [0, 2, 4, 6, 8, 10, 12, 14, 16, 18]
        
        func binarySearch(_ target: Int, start: inout Int, end: inout Int) -> Int? {
            
            // 빈 배열이나 하나인 배열, 재귀함수 종료 조건
            if start > end {
                return nil
            }
            
            // 소수점 이하 제거
            var mid = (start + end) / 2
            
            if arr[mid] == target {
                return mid
            } else if arr[mid] > target {
                end = mid - 1
                return binarySearch(target, start: &start, end: &end)
            } else if arr[mid] < target {
                start = mid + 1
                return binarySearch(target, start: &start, end: &end)
            }
            
            return nil
        }
        
        // 값이 특정 범위에 속하는 데이터 개수 구하기 -> 파이썬에서는 라이브러리를 쓰는데 스위프트에는 있을까? 찾아봐야함...
        
        // 이진탐색으로 문제가 출제되는 경우 파라메트릭 서치로 출제되는 경우가 많다.
        // 파라메트릭서치란? 최적화 문제를 결정 문제('예', '아니오')로 해결하는 기법
        // 예시. 특정한 조건을 만족하는 가장 알맞은 값을 빠르게 찾는 최적화 문제
        // 이진탐색으로 해결 가능!
        
        func ParametricSearch() {
            
            let Nx = readLine()!.components(separatedBy: " ").map { Int($0)! }
            let N = Nx[0]
            let x = Nx[1]

            var arr = readLine()!.components(separatedBy: " ").map { Int($0)! }

            var start = 0
            var end = arr.count - 1

            var firstIndex = 0
            var lastIndex = arr.count - 1

            while start <= end {
                let mid = (start + end) / 2
                if arr[mid] >= x {
                    end = mid - 1
                } else {
                    firstIndex = mid
                    end = mid - 1
                }
            }

            start = 0
            end = arr.count - 1

            while start <= end {
                let mid = (start + end) / 2
                if arr[mid] <= x {
                    start = mid + 1
                } else {
                    lastIndex = mid
                    start = mid + 1
                }
            }

            if lastIndex - firstIndex - 1 <= 0 {
                print(-1)
            } else {
                print(lastIndex - firstIndex - 1)
            }
            
        }
        
    }
    
    
    
}
