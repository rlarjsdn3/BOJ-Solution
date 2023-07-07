import Foundation

struct Queue<T> {
    var items: [T] = []
    
    var isEmpty: Bool {
        items.isEmpty
    }
    
    mutating func enqueue(_ element: T) {
        items.append(element)
    }
    
    mutating func dequeue() -> T {
        items.removeFirst()
    }
}

func bfs(_ friendship: [[Int]], start: Int, degree: inout [Int]) {
    var queue = Queue<Int>()
    queue.enqueue(start)
    // 해당 노드 방문 표시
    degree[start] = 0
    // 큐가 빌 때까지 반복
    while !queue.isEmpty {
        let d = queue.dequeue()
        
        // 인접 노드에 방문하지 않았다면
        for i in friendship[d] where degree[i] == -1 {
            degree[i] = degree[d] + 1
            queue.enqueue(i)
        }
    }
}

// 유저의 수 N과 관계의 수 M 입력 받기
let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let (n, m) = (input[0], input[1])
// 관계의 정보 입력 받기
var friendship = [[Int]](repeating: [Int](), count: n + 1)
for _ in 0..<m {
    // 친구 관계 A, B 입력 받기
    let input = readLine()!.split(separator: " ").map { Int(String($0))! }
    friendship[input[0]].append(input[1])
    friendship[input[1]].append(input[0])
}

// 케빈 베이컨 단계 수의 합을 저장할 변수
var cabinSum = [Int](repeating: 0, count: n + 1)

// 각 유저를 기준으로 케빈 베이컨 게임하기
for i in 1...n {
    var degree = [Int](repeating: -1, count: n + 1)
    bfs(friendship, start: i, degree: &degree)
    cabinSum[i] = degree.sum
}

// 결과값 출력
cabinSum.removeFirst()
let cabinMin = cabinSum.min()!
print(cabinSum.firstIndex(where: { $0 == cabinMin })! + 1)

extension Array where Element: Numeric {
    var sum: Element {
        self.reduce(0, +)
    }
}
