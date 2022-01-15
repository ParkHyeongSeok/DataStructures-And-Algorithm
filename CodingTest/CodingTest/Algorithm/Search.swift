//
//  Search.swift
//  CodingTest
//
//  Created by 박형석 on 2021/08/10.
//

import Foundation


// 하나씩 일일이 다 센다는 점에서 완전 탐색!
// 완전 탐색 문제 유형은 가능한 경우의 수를 모두 검사해보는 탐색 방법


struct BFS {
    // 너비 우선 탐색
    // 시작 노드에서 가까운 노드부터 우선적으로 탐색하는 알고리즘
    // 큐 자료구조를 이용
    // 1) 시작 노드를 큐에 넣고 방문처리
    // 2) 큐에서 노드를 꺼낸 뒤에, 해당 노드의 인접 노드 중에서 방문하지 않은 노드를 모두 큐에 삽입하고 방문처리
    // (DFS의 경우는 인접하지 않은 노드를 다시 한 번씩 큐에 넣으면서 방문을 수행, BFS에서는 인접하지 않은 노드를 한번에 넣는다는 점이 특징)
    // 3) 2번의 과정을 수행할 수 없을 때까지 반복
    
    /*
     
     마찬가지로 1번 노드를 시작노드, 방문 기준을 번호가 낮은 인접 노드부터!
     
     1. 시작노드를 큐에 넣고 방문처리
     2. 1번을 빼서 관련한 노드(2, 3, 8)를 큐에 삽입. 방문처리
     3. 큐에서 노드 2를 꺼내고 탐색하지 않은 7번은 큐에 삽입, 방문처리
     4. 다음은 큐에 3번이 나올 차례, 인접하고 방문하지 않은 4, 5를 큐에 넣고 방문처리
     5. 다음은 8인데 다 방문했으니 스킵
     6. 다음 7번은 6번
     7.  1 - 2 - 3 - 8- 7 - 4 - 5 - 6
     
     *기준과 시작점이 같은데, 자료구조 이용에 따라서 탐색 순서가 정해진다.
     - DFS는 관련한 노드 중 작은 노드를 스택에 넣으면서 탐색
     - BFS는 관련한 노드를 모두 넣고, 하나씩 큐에서 빼내면서 탐색
     
     *BFS의 경우 가까운 노드부터 넓게 탐색을 끝나고 깊이 들어간다.
     => 가장 마지막에 탐색하는 녀석이 가능 먼 녀석이다.
     => 이런 특정 때문에 간선의 비용이 동일한 조건에서 최단거리 문제를 해결할 수 있다.
     */
    
    let graph = [
        [],
        [2, 3, 8],
        [1, 7],
        [1, 4, 5],
        [3, 5],
        [3, 4],
        [7],
        [2, 6, 8],
        [1, 7]
    ]
    
    var visited = Array(repeating: false, count: 9)
    
    func bfs(graph: [[Int]], visited: inout [Bool], start: Int) {
        
        var queue = Queue<Int>()
        
        queue.enqueue(start)
        visited[start] = true
        
        while !queue.isEmpty {
            guard let v = queue.dequeue() else { return }
            print(v)
            for i in graph[v] {
                if !visited[i] {
                    queue.enqueue(i)
                    visited[i] = true
                }
            }
        }
        
    }
    
}

struct 미로찾기문제 {
    
    let NM = readLine()!.components(separatedBy: " ")
    lazy var N = Int(NM[0])!
    lazy var M = Int(NM[1])!

    // 2차원 배열(매트릭스) 그래프 초기화
    lazy var graph = Array<[Int]>(repeating: [], count: N)

    // 2차원 배열에 입력 받은 것들 채워넣기
    for i in 0..<N {
        let nums = readLine()!
        nums.forEach { char in
            graph[i].append(Int(String(char))!)
        }
    }

    // 방향벡터 dx[i], dy[i] 함께 사용해서 방향 설정 및 방향 순회 가능
    let dx = [-1, 1, 0, 0]
    let dy = [0, 0, -1, 1]

    func bfs(x: Int, y: Int) -> Int {
        
        var queue = Queue<(Int, Int)>()
        queue.enqueue((x, y))
        
        while !queue.isEmpty {
            
            // 반복문 옵셔널 언래핑 빠져나오기
            guard let v = queue.dequeue() else { break }
            
            // 방향 벡터 바꾸기
            for i in 0..<4 {
                
                let nx = v.0 + dx[i]
                let ny = v.1 + dy[i]
                
                // x가 세로임... x가 N개면 N-1 인덱스 존재 고로 =은 빼줘야함
                if nx < 0 || nx >= N || ny < 0 || ny >= M {
                    continue
                }
                
                // 만들어놓은 벽
                if  graph[nx][ny] == 0 {
                    continue
                }
                
                // 방문 처리 방법을 +1을 계속해나가는 방식으로 만듦.
                // 그래서 이전은 1보다 큰 수이기 때문에 방문처리가 되고 1만 찾아서 갈 수 있는 거임
                if graph[nx][ny] == 1 {
                    // 현재큐에 담겨진 좌표값을 계속 업뎃해줘야 하기에 튜플값을 가져옴
                    graph[nx][ny]  = graph[v.0][v.1] + 1
                    queue.enqueue((nx, ny))
                }
            }
        }
        // 전체 그래프의 마지막에 있는 녀석을 출력함
        return graph[N-1][M-1]
    }
}

