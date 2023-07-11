import Foundation

// 무한(10억)을 의미하는 변수 선언
let INF = Int(10e9)

// 다익스트라 알고리즘을 수행하는 함수
func dijkstra(_ start: Int) {
    // 최초 방문 노드 표시
    distance[start] = 0
    visited[start] = true
    // 인접 노드의 최단거리 갱신하기
    for node in graph[start] {
        distance[node.no] = node.cost
    }
    // n-1번 반복하며 최단 거리 찾기
    for _ in 1..<n {
        let now = getSmallestNode()
        visited[now] = true
        // 인접 노드를 순회하며
        for node in graph[now] {
            let cost = distance[now] + node.cost
            // 현재 노드를 경유하여 인접 노드로 가는 게 더 빠르면
            if cost < distance[node.no] {
                distance[node.no] = cost // 최단거리 갱신하기
            }
        }
    }
}

// 가장 거리가 짧은 노드를 선택하는 함수
func getSmallestNode() -> Int {
    var index = 0 // 노드 번호를 저장하는 변수
    var minValue = INF // 비용을 저장하는 변수
    // 각 노드를 순회하며
    for i in 1...n {
        // 비용이 가장 적으면서 방문하지 않은 노드 저장
        if distance[i] < minValue && !visited[i] {
            index = i
            minValue = distance[i]
        }
    }
    return index // 비용이 가장 적은 노드 반환
}

// 지역의 개수 N, 수색 범위 M과 길의 개수 R 입력 받기
let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let (n, m, r) = (input[0], input[1], input[2])
// 각 지역의 아이템의 수 입력 받기
var items = [0]
items.append(contentsOf: readLine()!.split(separator: " ").map { Int(String($0))! })
// 그래프 정보를 저장하는 변수
var graph = [[(no: Int, cost: Int)]](repeating: [(no: Int, cost: Int)](), count: n + 1)
// 그래프 정보 입력 받기
for _ in 0..<r {
    let input = readLine()!.split(separator: " ").map { Int(String($0))! }
    let (a, b, l) = (input[0], input[1], input[2])
    // 노드 a에서 노드 b까지 거리가 l이라는 의미
    graph[a].append((b, l))
    graph[b].append((a, l))
}
// 방문 여부를 확인하는 변수 선언
var visited = [Bool]()
// 최단 거리 테이블 선언
var distance = [Int]()
// 아이템을 얻을 수 있는 최대 개수를 저장하는 변수 선언
var result = [Int](repeating: 0, count: n + 1)

for i in 1...n {
    // 방문 여부를 확인하는 변수 초기화
    visited = [Bool](repeating: false, count: n + 1)
    // 최단 거리 테이블 초기화
    distance = [Int](repeating: INF, count: n + 1)
    // 다익스트라(dijkstra) 알고리즘 수행
    dijkstra(i)
    // 아이템의 합계를 저장하는 변수
    var sum = 0
    // 거리가 m 이하인 노드만 골라내어
    for i in 1...n {
        if distance[i] <= m {
            // 총 얻을 수 있는 아이템의 합계를
            sum += items[i]
        }
    }
    // result 배열에 저장
    result[i] = sum
}
// 결과값 출력하기
print(result.max()!)
