import Foundation

struct Edge {
    var next: Int
    var weight: Int
    
    init(_ next: Int, _ weight: Int) {
        self.next = next
        self.weight = weight
    }
}
typealias Graph = [[Edge]]


// 깊이 우선 탐색(DFS) 정의
func dfs(
    _ graph: Graph,
    _ v: Int,
    _ weight: Int,
    _ visited: inout [Bool],
    _ farNode: inout Int,
    _ maxWeight: inout Int
) {
    // 해당 노드 방문 처리
    visited[v] = true
    // 현재 노드까지 가중치가 최대 가중치보다 더 크다면
    if weight > maxWeight {
        farNode = v
        maxWeight = weight // 최대 가중치 값 갱신
    }

    // 인접한 노드에 아직 방문하지 않았다면
    for i in graph[v] where !visited[i.next] {
        dfs(graph, i.next, weight + i.weight, &visited, &farNode, &maxWeight)
    }
}

// 트리의 지름 구하기 함수 정의
func findTreeDiameter(_ v: Int, _ graph: Graph) -> Int {
    var visited = [Bool](repeating: false, count: n + 1)
    var farNode = 0 // 가장 먼 노드 번호
    var maxWeight = 0 // 가장 큰 가중치 저장

    // 임의의 노드를 시작으로 가장 멀리 있는 노드 X 탐색
    dfs(graph, v, 0, &visited, &farNode, &maxWeight)
    
    // 노드 X에서 시작해 가장 멀리 있는 노드 Y까지 탐색
    visited = [Bool](repeating: false, count: n + 1)
    dfs(graph, farNode, 0, &visited, &farNode, &maxWeight)
    
    return maxWeight
}

// 노드의 개수 N 입력 받기
let n = Int(readLine()!)!
// 무방향 그래프 선언
var graph = Graph(repeating: [], count: n + 1)

// N-1개의 간선 정보 U, V, W 입력 받기
for _ in 0..<n-1 {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    let (u, v, w) = (input[0], input[1], input[2])
    
    graph[u].append(Edge(v, w))
    graph[v].append(Edge(u, w))
}

// 결과 답안 출력
print(findTreeDiameter(1, graph))
