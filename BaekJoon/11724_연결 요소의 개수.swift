import Foundation

// 깊이 우선 탐색 구현
@discardableResult func dfs(_ graph: [[Int]], v: Int, visited: inout [Bool]) -> Bool {
    // 이미 방문한 적이 있는 경우
    if visited[v] {
        return false // false 반환
    }
    visited[v] = true // 정점 방문 표시
    
    // 인접 정점 순회
    for i in graph[v] {
        // 방문한 적이 없는 경우
        if !visited[i] {
            dfs(graph, v: i, visited: &visited)
        }
    }
    
    return true // true 반환
}

let input: [Int] = readLine()!.split(separator: " ").map { Int(String($0))! }
let (n, m): (Int, Int) = (input[0], input[1]) // 정점의 개수와 간선의 개수 입력 받기

var graph: [[Int]] = [[Int]](repeating: [Int](), count: n+1)
for _ in 0..<m {
    let input: [Int] = readLine()!.split(separator: " ").map { Int(String($0))! }
    let (u, v): (Int, Int) = (input[0], input[1])
    graph[u].append(v); graph[v].append(u)
}

var visited: [Bool] = [Bool](repeating: false, count: n+1)

var result: Int = 0
for v in 1...n {
    if dfs(graph, v: v, visited: &visited) {
        result += 1
    }
}
print(result) // 결과 출력
