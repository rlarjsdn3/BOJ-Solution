import Foundation

let input: [Int] = readLine()!.split(separator: " ").map { Int(String($0))! }
let (n, m, r) = (input[0], input[1], input[2]) // 정점의 수, 간선의 수, 시작 정점 입력받기
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
var visited: [Int] = [Int](repeating: 0, count: n+1) // 방문한 노드인지 확인하는 배열

var count: Int = 1
func dfs(_ graph: [[Int]], vertex: Int, visited: inout [Int]) {
    // 해당 노드에 방문했다고 표시 (방문 순서 기록하기)
    visited[vertex] = count
    
    for i in graph[vertex] {
        // 해당 노드를 방문하지 않았으면
        if visited[i] == 0 {
            // 방문하고 순서 매기기
            count += 1
            dfs(graph, vertex: i, visited: &visited)
        }
    }
}

dfs(graph, vertex: r, visited: &visited) // 깊이 우선 탐색 수행

// 결과 출력
for i in 1...n {
    print(visited[i])
}
