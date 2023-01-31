import Foundation

@discardableResult
func dfs(_ graph: inout [[Int]], x: Int, y: Int) -> Bool {
    // 좌표가 지도 크기의 범위를 넘어서면 false 반환
    if x < 0 || x >= graph.count || y < 0 || y >= graph[0].count {
        return false
    }
    
    // 해당 노드에 방문하지 않았으면
    if graph[x][y] == 1 {
        // 해당 노드 방문 처리
        graph[x][y] = 0
        
        // 가로, 세로와 대각선으로 순회
        dfs(&graph, x: x, y: y + 1)
        dfs(&graph, x: x, y: y - 1)
        dfs(&graph, x: x + 1, y: y)
        dfs(&graph, x: x - 1, y: y)
        dfs(&graph, x: x + 1, y: y - 1)
        dfs(&graph, x: x - 1, y: y + 1)
        dfs(&graph, x: x + 1, y: y + 1)
        dfs(&graph, x: x - 1, y: y - 1)
        return true
    }
    
    return false
}

var result: [Int] = []
var visited: [Bool] = []
while true {
    // W와 H 입력 받기
    let input: [Int] = readLine()!.split(separator: " ").map { Int(String($0))! }
    let (w, h) = (input[0], input[1])
    // W와 H를 0으로 입력받으면 루프 탈출
    guard w != 0 && h != 0 else {
        break
    }
    
    // 간선 정보 입력 받기
    var graph: [[Int]] = []
    for _ in 0..<h {
        graph.append(readLine()!.split(separator: " ").map { Int(String($0))! })
    }
    
    // 섬의 개수를 세어 결과 저장
    var count: Int = 0
    for i in 0..<h {
        for j in 0..<w {
            // 섬이 존재하면 count 증가
            if dfs(&graph, x: i, y: j) {
                count += 1
            }
        }
    }
    
    result.append(count)
}

// 결과 출력
result.forEach { print($0) }
