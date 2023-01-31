import Foundation

// 정점의 개수 N 입력 받기
let n: Int = Int(readLine()!)!
// 그래프의 인접 행렬 입력 받기
var graph: [[Int]] = []
for _ in 0..<n {
    graph.append(readLine()!.split(separator: " ").map { Int(String($0))! })
}

// 플로이드-워셜 최단거리 탐색 수행
for k in 0..<n {
    for i in 0..<n {
        for j in 0..<n {
            // 정점 k를 경유해서 i에서 j로 가는 경로가 존재하는 경우
            if graph[i][k] == 1 && graph[k][j] == 1{
                graph[i][j] = 1
            }
        }
    }
}

// 결과값 출력
for x in 0..<n {
    for y in 0..<n {
        print(graph[x][y], terminator: " ")
    }
    print()
}
