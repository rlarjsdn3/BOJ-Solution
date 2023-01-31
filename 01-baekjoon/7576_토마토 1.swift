import Foundation

// 그래프 노드 구조체
struct Node {
    var x, y: Int // 좌표값을 저장하는 변수
    var count: Int // 횟수를 저장하는 변수
    
    init(_ x: Int, _ y: Int, count: Int) {
        self.x = x
        self.y = y
        self.count = count
    }
}

// 큐 구조체
public struct Queue<T> {
    fileprivate var array: [T?] = []
    fileprivate var head: Int = 0
    
    var isEmpty: Bool {
        return count == 0
    }
    
    var count: Int {
        return array.count - head
    }
    
    public mutating func enqueue(_ element: T) {
        array.append(element)
    }
    
    @discardableResult public mutating func dequeue() -> T? {
        guard let element = array[guarded: head] else {
            return nil
        }
        
        array[head] = nil
        head += 1
        
        let percentage: Double = Double(head) / Double(array.count)
        if count > 50 && percentage > 0.25 {
            array.removeFirst(head)
            head = 0
        }
        
        return element
    }
    
    var front: T? {
        guard !isEmpty else {
            return nil
        }
        
        return array[head]
    }
}

extension Array {
    subscript(guarded index: Int) -> Element? {
        guard (startIndex..<endIndex).contains(index) else {
            return nil
        }
        
        return self[index]
    }
}

// 상자의 크기 N과 M 입력 받기
let input: [Int] = readLine()!.split(separator: " ").map { Int(String($0))! }
let (n, m): (Int, Int) = (input[0], input[1])

// 토마토의 정보 입력받기
var tomato: [[Int]] = []
for _ in 0..<m {
    tomato.append(readLine()!.split(separator: " ").map { Int(String($0))! })
}

// 너비 우선 탐색(BFS) 수행
var queue: Queue<Node> = Queue<Node>()

for i in 0..<m { // 처음 토마토가 위치한 좌표 큐에 삽입하기
    for j in 0..<n {
        if tomato[i][j] == 1 {
            queue.enqueue(Node(i, j, count: 0))
        }
    }
}

// 네 가지 방향을 저장한 변수(상, 하, 좌, 우)
let dx: [Int] = [-1, 1, 0, 0]
let dy: [Int] = [0, 0, 1, -1]

var count: Int = 0
while !queue.isEmpty {
    let node: Node = queue.dequeue()!
    count = node.count
    
    // 네 가지 방향으로 이동
    for i in 0..<4 {
        let nx: Int = node.x + dx[i]
        let ny: Int = node.y + dy[i]
        
        // 새로운 좌표가 토마토 상자 범위를 넘어서는 경우
        if nx < 0 || nx >= m || ny < 0 || ny >= n {
            continue
        }
        
        // 새로운 좌표의 토마토가 썩어있는 경우
        if tomato[nx][ny] == -1 {
            continue
        }
        
        // 새로운 좌표에 아직 방문하지 않은 경우
        if tomato[nx][ny] == 0 {
            queue.enqueue(Node(nx, ny, count: node.count + 1)) // 큐에 해당 좌표 삽입하고
            tomato[nx][ny] = 1 // 해당 좌표 방문 표시하기
        }
    }
}

// 토마토가 모두 익었는지 확인하기
var check: Bool = true
for i in 0..<m {
    for j in 0..<n {
        if tomato[i][j] == 0 { // 하나라도 익지 않은 토마토가 있는 경우
            check = false
        }
    }
}

// 결과 출력하기
if check {
    print(count)
} else {
    print(-1)
}
