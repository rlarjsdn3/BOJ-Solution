import Foundation

final class FileIO {
    private var buffer:[UInt8]
    private var index: Int
    
    init(fileHandle: FileHandle = FileHandle.standardInput) {
        buffer = Array(fileHandle.readDataToEndOfFile())+[UInt8(0)]
        index = 0
    }
    
    @inline(__always) private func read() -> UInt8 {
        defer { index += 1 }
        
        return buffer.withUnsafeBufferPointer { $0[index] }
    }
    
    @inline(__always) func readInt() -> Int {
        var sum = 0
        var now = read()
        var isPositive = true
        
        while now == 10
                || now == 32 { now = read() }
        if now == 45{ isPositive.toggle(); now = read() }
        while now >= 48, now <= 57 {
            sum = sum * 10 + Int(now-48)
            now = read()
        }
        
        return sum * (isPositive ? 1:-1)
    }
}

typealias Graph = [[Int]]

// DFS 메서드 정의
func dfs(_ graph: Graph, v: Int, visited: inout [Int]) {
    // 해당 노드 방문 처리
    visited[v] = order
    order += 1
    
    // 인접 노드를 순회하며 방문하지 않은 노드 방문
    for v in graph[v] where visited[v] == 0 {
        dfs(graph, v: v, visited: &visited)
    }
}

let fileIO = FileIO()

// 정점의 수 N, 간선의 M과 시작 정점 R 입력 받기
let (n, m, r) = (fileIO.readInt(), fileIO.readInt(), fileIO.readInt())
// 그래프를 인접 리스트로 표현
var graph: Graph = Graph(repeating: [Int](), count: n + 1)
// M개 만큼 정점 U와 V 정보 입력 받기
for _ in 0..<m {
    let (u, v) = (fileIO.readInt(), fileIO.readInt())
    graph[u].append(v)
    graph[v].append(u)
}

// 정점을 순회하며 오름차순으로 정렬하기
for (i, nodes) in graph.enumerated() {
    graph[i] = nodes.sorted()
}

// 방문 순서 저장
var order = 1
// 방문 처리를 위한 배열
var visited = [Int](repeating: 0, count: n + 1)

dfs(graph, v: r, visited: &visited)

// 답안 결과 출력
for i in 1...n {
    print(visited[i])
}
