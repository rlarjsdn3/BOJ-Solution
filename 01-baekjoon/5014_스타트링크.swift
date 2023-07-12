import Foundation

// 노드 정의
struct Node {
    var floor: Int
    var count: Int
    
    init(_ floor: Int, count: Int) {
        self.floor = floor
        self.count = count
    }
}

// 큐(Queue) 자료구조 정의
struct Queue<T> {
    private var items: [T] = []
    
    var isEmpty: Bool {
        items.isEmpty
    }
    
    mutating func enqueue(_ element: T) {
        items.append(element)
    }
    
    mutating func dequeue() -> T? {
        guard !items.isEmpty else {
            return nil
        }
        return items.removeFirst()
    }
}

// 너비 우선 탐색(BFS) 알고리즘 정의
func bfs(_ start: Int, visited: inout [Bool]) -> Int? {
    // 큐 자료구조 선언
    var queue = Queue<Node>()
    queue.enqueue(Node(start, count: 0))
    // 처음 노드 방문 표시
    visited[start] = true
    // 큐가 빌 때까지
    while !queue.isEmpty {
        let now = queue.dequeue()!
        // 현재 위치한 층이 G층이면
        if now.floor == g {
            return now.count
        }
        
        // 인접한 층으로 이동
        for i in [u, d] {
            let newFloor = now.floor + i
            // 새로 이동한 층이 건물 층의 범위를 벗어난다면
            if newFloor < 1 || newFloor > f {
                continue
            }
            
            // 아직 방문하지 않았다면
            if !visited[newFloor] {
                queue.enqueue(Node(newFloor, count: now.count + 1))
                // 새로 이동한 층에 방문 표시
                visited[newFloor] = true
                
                // NOTE: - 새로운 층에 대해 방문 여부를 표시해주지 않는다면, 해당 층이 큐에서
                //       - 빠져나가기 전까지 동일한 층이 계속 큐에 삽입될 수 있음. 이는 메모리 공간 낭비로 이어짐
            }
        }
    }
    
    return nil
}

// 건물의 총 층 수 F
// 강호가 위치한 층 수 S
// 회사가 위치한 층 수 G
// 상승 버튼 U
// 하강 버튼 D 입력 받기
let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let (f, s, g, u, d) = (input[0], input[1], input[2], input[3], -input[4])
// 이미 방문한 층인지 확인하는 변수 선언
var visited = [Bool](repeating: false, count: f + 1)

// 너비 우선 탐색(BFS) 알고리즘 수행 및 결과값 출력하기
if let count = bfs(s, visited: &visited) {
    print(count)
} else {
    print("use the stairs")
}
