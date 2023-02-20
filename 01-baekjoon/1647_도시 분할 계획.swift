import Foundation

// 빠른 입출력(IO) 클래스
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
    
    @inline(__always) func readString() -> String {
        var str = ""
        var now = read()
        
        while now == 10
                || now == 32 { now = read() }
        
        while now != 10
                && now != 32 && now != 0 {
            str += String(bytes: [now], encoding: .ascii)!
            now = read()
        }
        
        return str
    }
}


// 같은 마을인지 확인하는 함수(find 연산)
func find(_ parent: inout [Int], _ x: Int) -> Int {
    if parent[x] != x {
        // 같은 집합의 모든 노드가 가장 상위 노드만 가리키게 됨(경로 압축)
        parent[x] = find(&parent, parent[x]) 
    }
    return parent[x]
}

// 집의 경로를 합치는 함수(union 연산)
func union(_ parent: inout [Int], _ a: Int, _ b: Int) {
    let a = find(&parent, a)
    let b = find(&parent, b)
    if a < b {
        parent[b] = a
    } else {
        parent[a] = b
    }
}

let fileIO = FileIO()

// 집의 개수 N, 길의 개수 M 입력 받기
let n = fileIO.readInt()
let m = fileIO.readInt()
// 길의 정보 입력 받기
var edges: [(a: Int, b: Int, cost: Int)] = []
for _ in 0..<m {
    let a = fileIO.readInt()
    let b = fileIO.readInt()
    let cost = fileIO.readInt()
    // input[0]에서 input[1]로 가는 비용이 input[2]라는 의미
    edges.append((a, b, cost))
}
// 부모 테이블 초기화
var parent = [Int](repeating: 0, count: n + 1)
(1...n).forEach { parent[$0] = $0 }

// 길의 정보를 비용이 오르는 순으로 정렬하기
edges.sort { $0.cost < $1.cost }

// 크루스칼(kruskal) 알고리즘 수행
var result = 0
var last = 0
for edge in edges {
    // 사이클이 형성되지 않으면
    if find(&parent, edge.a) != find(&parent, edge.b) {
        union(&parent, edge.a, edge.b)
        result += edge.cost
        last = edge.cost
    }
}
print(result - last) // 결과값 출력하기
