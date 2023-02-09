import Foundation

// 특정 원소가 속한 집합을 찾기
func find(_ parent: inout [Int], _ x: Int) -> Int {
    // 루트 노드가 아니라면, 루트 노드를 찾을 때까지 재귀적으로 반복
    if parent[x] != x {
        parent[x] = find(&parent, parent[x])
    }
    return parent[x]
}

// 두 원소가 속한 집합을 합치기
func union(_ parent: inout [Int], _ a: Int, _ b: Int) {
    let a = find(&parent, a)
    let b = find(&parent, b)
    if a < b {
        parent[b] = a
    } else {
        parent[a] = b
    }
}

// 정점의 개수 N과 간선의 개수 M 입력 받기
let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let (n, m) = (input[0], input[1])

// 부모 테이블 초기화
var parent = [Int](repeating: 0, count: n + 1)
// 부모 테이블 상에서, 부모를 자기 자신으로 초기화
(1...n).forEach { parent[$0] = $0 }

var result: [String] = []

// 사이클 판별 여부 S와 합칠 두 정점 A, B 입력 받기
for _ in 0..<m {
    let input = readLine()!.split(separator: " ").map { Int(String($0))! }
    let (s, a, b) = (input[0], input[1], input[2])
    
    if s == 0 {
        union(&parent, a, b)
    } else {
        if find(&parent, a) == find(&parent, b) {
            result.append("YES")
        } else {
            result.append("NO")
        }
    }
}
result.forEach { print($0) } // 결과값 출력하기
