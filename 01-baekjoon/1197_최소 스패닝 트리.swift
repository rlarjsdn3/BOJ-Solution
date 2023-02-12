// find 연산(서로소 집합)
func find(_ parent: inout [Int], _ x: Int) -> Int {
    // 루트 노드가 아니라면, find 함수 재귀 호출(좌표 압축)
    if parent[x] != x {
        parent[x] = find(&parent, parent[x])
    }
    return parent[x]
}

// union 연산(서로소 집합)
func union(_ parent: inout [Int], _ a: Int, _ b: Int) {
    let a = find(&parent, a)
    let b = find(&parent, b)
    if a < b {
        parent[b] = a
    } else {
        parent[a] = b
    }
}

// 정점의 개수 V와 간선의 개수 E 입력 받기
let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let (v, e) = (input[0], input[1])

// 간선과 비용 정보 입력 받기
var edges: [(Int, Int, cost: Int)] = []
for _ in 0..<e {
    let input = readLine()!.split(separator: " ").map { Int(String($0))! }
    // input[0]에서 input[1]로 가는 비용이 input[2]라는 의미
    edges.append((input[0], input[1], input[2]))
}

// 부모 테이블 초기화
var parent = [Int](repeating: 0, count: v + 1)
(1...v).forEach { parent[$0] = $0 }

// 비용을 중심으로 오름차순 정렬
edges.sort { $0.cost < $1.cost }

// 크루스칼 알고리즘 수행
var result = 0
for edge in edges {
    // 두 노드가 사이클을 형성하지 않는다면, 합치기
    if find(&parent, edge.0) != find(&parent, edge.1) {
        union(&parent, edge.0, edge.1)
        result += edge.cost
    }
}

// 결과값 출력하기
print(result)
