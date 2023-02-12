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

// 컴퓨터의 수 N 입력 받기
let n = Int(readLine()!)!
// 네트워크 선의 수 M 입력 받기
let m = Int(readLine()!)!

// 부모 테이블 초기화
var parent = [Int](repeating: 0, count: n + 1)
(1...n).forEach { parent[$0] = $0 }

// 네트워크 연결 정보와 비용 입력 받기
var networks: [(Int, Int, cost: Int)] = []
for _ in 0..<m {
    let input = readLine()!.split(separator: " ").map { Int(String($0))! }
    networks.append((input[0], input[1], input[2]))
}

// 네트워크 연결 정보 정렬(오름차순)
networks.sort { $0.cost < $1.cost }

// 크루스칼 알고리즘 수행
var result = 0
for network in networks {
    // 두 노드가 사이클을 형성하지 않는다면
    if find(&parent, network.0) != find(&parent, network.1) {
        union(&parent, network.0, network.1)
        result += network.cost
    }
}

// 결과값 출력하기
print(result)
