import Foundation

// 정점의 수, 간선의 수 입력받기
let n: Int = Int(readLine()!)!
let m: Int = Int(readLine()!)!
var graph: [[Int]] = [[Int]](repeating: [Int](), count: n+1);

// 간선을 연결 리스트 형태로 입력받기
for _ in 0..<m {
    let input: [Int] = readLine()!.split(separator: " ").map { Int(String($0))! }
    let (u, v) = (input[0], input[1])
    graph[u].append(v)
    graph[v].append(u)
}

// 오름차순으로 탐색해야 하므로 정렬
for i in 1...n {
    graph[i].sort()
}
var visited: [Bool] = [Bool](repeating: false, count: n+1) // 방문한 노드인지 확인하는 배열

var count: Int = 1
func dfs(_ graph: [[Int]], vertex: Int, visited: inout [Bool]) {
    // 해당 노드에 방문했다고 표시
    visited[vertex] = true
    
    for i in graph[vertex] {
        // 해당 노드를 방문하지 않았으면
        if !visited[i] {
            // 방문하기
            dfs(graph, vertex: i, visited: &visited)
        }
    }
}

dfs(graph, vertex: 1, visited: &visited) // 깊이 우선 탐색 수행

// 1번 컴퓨터를 제외한 윔 바이러스에 걸린 컴퓨터의 수 계산 후 출력하기
var result: Int = 0
for i in 1...n {
    if visited[i] {
        result += 1
    }
}
print(result - 1)
