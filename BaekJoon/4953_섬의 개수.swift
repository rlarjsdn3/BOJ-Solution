import Foundation

@discardableResult
func dfs(_ graph: inout [[Int]], x: Int, y: Int) -> Bool {
    // 시작점(x, y)가 범위를 벗어나는 경우 false 리턴
    if x < 0 || x >= graph.count || y < 0 || y >= graph[0].count {
        return false
    }
    
    // 시작점(x, y)을 아직 방문하지 않은 경우
    if graph[x][y] == 1 {
        // 시작점 방문 처리
        graph[x][y] = 0
        
        // 각 좌표점으로 육지가 존재하는지 확인
        dfs(&graph, x: x + 1, y: y)
        dfs(&graph, x: x - 1, y: y)
        dfs(&graph, x: x, y: y + 1)
        dfs(&graph, x: x, y: y - 1)
        dfs(&graph, x: x + 1, y: y + 1)
        dfs(&graph, x: x + 1, y: y - 1)
        dfs(&graph, x: x - 1, y: y + 1)
        dfs(&graph, x: x - 1, y: y - 1)
        return true
    }
    
    return false
}

var result: [Int] = []
while true {
    let input: [Int] = readLine()!.split(separator: " ").map { Int(String($0))! }
    let w: Int = input[0]
    let h: Int = input[1]
    
    // W와 H가 0이 입력되면 while문 탈출
    if w == 0 && h == 0 {
        break
    }
    
    var graph: [[Int]] = []
    for _ in 0..<h {
        graph.append(readLine()!.split(separator: " ").map { Int(String($0))! })
    }
    
    // 모든 시작점을 기준으로
    // 하나의 이어지는 육지가 존재하면 count 증가
    var count: Int = 0
    for i in 0..<h {
        for j in 0..<w {
            if dfs(&graph, x: i, y: j) {
                count += 1
            }
        }
    }
    
    result.append(count)
}
result.forEach { print($0) }
