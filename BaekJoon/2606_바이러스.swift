import Foundation

// 깊이 우선 탐색 구현 함수
func dfs(_ graph: [[Int]], v: Int, visited: inout [Bool]) {
    visited[v] = true
    
    for i in graph[v] {
        if !visited[i] {
            dfs(graph, v: i, visited: &visited)
        }
    }
}

let n: Int = Int(readLine()!)! // 컴퓨터의 수
let m: Int = Int(readLine()!)! // 연결된 간선의 수
var graph: [[Int]] = [[Int]](repeating: [Int](), count: n+1)
for _ in 0..<m {
    // 그래프를 연결된 리스트 형테로 입력 받기
    let input: [Int] = readLine()!.split(separator: " ").map { Int(String($0))! }
    let u: Int = input[0]
    let v: Int = input[1]
    graph[u].append(v)
    graph[v].append(u)
}

// 해당 노드를 방문했는지 체크하는 변수
var visited: [Bool] = [Bool](repeating: false, count: n+1)

// 시작점을 1로 하여 깊이 우선 탐색 수행
dfs(graph, v: 1, visited: &visited)
print(visited.filter { $0 == true }.count - 1) // visited 배열 중에서 true인 값만 세어 출력하기
