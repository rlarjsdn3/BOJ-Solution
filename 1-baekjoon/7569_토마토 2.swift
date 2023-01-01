import Foundation

// 큐 구조체
struct Queue<T> {
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
        guard let element: T? = array[guarded: head] else {
            return nil
        }
        
        array[head] = nil
        head += 1
        
        let percentage: Double = Double(head) / Double(array.count)
        if array.count > 50 && percentage > 0.25 {
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
    public subscript(guarded index: Int) -> Element? {
        guard (startIndex..<endIndex).contains(index) else {
            return nil
        }
        
        return self[index]
    }
}

// 그래프 노드 구조체
struct Node {
    var x, y, z: Int // 3차원 좌표값을 저장하는 변수
    var count: Int // 횟수를 저장하는 변수
    
    init(_ x: Int, _ y: Int, _ z: Int, count: Int) {
        self.x = x
        self.y = y
        self.z = z
        self.count = count
    }
}

// 토마토 상자의 가로 길이 M, 세로 길이 N과 높이 H 입력 받기
let input: [Int] = readLine()!.split(separator: " ").map { Int(String($0))! }
let (m, n, h): (Int, Int, Int) = (input[0], input[1], input[2])

// 토마토 상자 정보 입력 받기
var tomato: [[[Int]]] = [[[Int]]](repeating: [[Int]](), count: h)
for i in 0..<h {
    for _ in 0..<n {
        tomato[i].append(readLine()!.split(separator: " ").map { Int(String($0))! })
    }
}

// 너비 우선 탐색(BFS) 수행 하기
var queue: Queue<Node> = Queue<Node>()

for z in 0..<h { // 처음 토마토의 위치 모두 큐에 삽입하기
    for y in 0..<n {
        for x in 0..<m {
            if tomato[z][y][x] == 1 {
                queue.enqueue(Node(x, y, z, count: 0))
            }
        }
    }
}

// 6가지 방향으로 좌표 이동을 도와주는 변수(상, 하, 좌, 우, 위, 아래)
let dx: [Int] = [-1, 1, 0, 0, 0, 0]
let dy: [Int] = [0, 0, 1, -1, 0, 0]
let dz: [Int] = [0, 0, 0, 0, 1, -1]

var count: Int = 0
while !queue.isEmpty {
    let node: Node = queue.dequeue()!
    count = node.count
    
    // 6가지 방향으로 이동
    for i in 0..<6 {
        let nx: Int = node.x + dx[i]
        let ny: Int = node.y + dy[i]
        let nz: Int = node.z + dz[i]
        
        // 토마토 상자의 범위를 넘어서는 경우
        if nx < 0 || nx >= m || ny < 0 || ny >= n || nz < 0 || nz >= h {
            continue
        }
        
        // 해당 위치에 아직 방문하지 않은 경우
        if tomato[nz][ny][nx] == 0 {
            queue.enqueue(Node(nx, ny, nz, count: node.count + 1)) // 큐에 삽입하고
            tomato[nz][ny][nx] = 1 // 해당 위치 방문 표시
        }
    }
}

// 모든 토마토가 익었는지 확인하기
var check: Bool = true
for z in 0..<h {
    for y in 0..<n {
        for x in 0..<m {
            if tomato[z][y][x] == 0 {
                check = false
            }
        }
    }
}

// 결과값 출력하기
if check {
    print(count)
} else {
    print(-1)
}
