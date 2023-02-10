import Foundation

func find(_ parent: inout [Int], _ x: Int) -> Int {
    if parent[x] != x {
        parent[x] = find(&parent, parent[x])
    }
    return parent[x]
}

func union(_ parent: inout [Int], _ a: Int, _ b: Int) {
    let a = find(&parent, a)
    let b = find(&parent, b)
    if a < b {
        parent[b] = a
    } else {
        parent[a] = b
    }
    
}

// 도시의 개수 N과 여행 계획에 속한 도시의 개수 M 입력 받기
let n = Int(readLine()!)!
let m = Int(readLine()!)!

// 부모 테이블 초기화
var parent = [Int](repeating: 0, count: n + 1)
(1...n).forEach { parent[$0] = $0 }

// 연결 정보 입력 받기
for i in 1...n {
    let input = readLine()!.split(separator: " ").map { Int(String($0))! }
    
    for j in 0..<n {
        if input[j] == 1 {
            union(&parent, i, j+1)
        }
    }
}

var check = true

// 여행 계획 정보 입력 받기
let plans = readLine()!.split(separator: " ").map { Int(String($0))! }
for i in 1..<m {
    // 여행 경로에서 인접한 도시 간 집합이 서로 다른 경우
    if find(&parent, plans[0]) != find(&parent, plans[i]) {
        check = false; break
    }
}

// 결과값 출력하기
print(check ? "YES" : "NO")
