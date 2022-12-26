import Foundation

// 그래프 노드 구조체
struct Node {
    var no: Int // 바이러스 번호를 저장한 변수
    var x: Int // x 좌표를 저장하는 변수
    var y: Int // y 좌표를 저장하는 변수
    var second: Int // 좌표가 저장된 시간을 저장하는 변수
    
    init(_ no: Int, _ x: Int, _ y: Int, second: Int) {
        self.no = no
        self.x = x
        self.y = y
        self.second = second
    }
}

// 큐 구조체
public struct Queue<T> {
    fileprivate var array: [T?] = []
    fileprivate var head: Int = 0
    
    public var isEmpty: Bool {
        return count == 0
    }
    
    public var count: Int {
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
        
        let percentage = Double(head) / Double(array.count)
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
    subscript(guarded index: Int) -> Element? {
        guard (startIndex..<endIndex).contains(index) else {
            return nil
        }
        
        return self[index]
    }
}

// 시험관의 크기 N과 바이러스의 개수 K 입력 받기
var input: [Int] = readLine()!.split(separator: " ").map { Int(String($0))! }
let (n, k): (Int, Int) = (input[0], input[1])

// 시험관 정보 입력 받기
var testTube: [[Int]] = []
for _ in 0..<n {
    testTube.append(readLine()!.split(separator: " ").map { Int(String($0))! })
}

// 초 S와 알아볼 위치 X, Y 입력 받기
input = readLine()!.split(separator: " ").map { Int(String($0))! }
let (s, x, y): (Int, Int, Int) = (input[0], input[1], input[2])

// 너비 우선 탐색(BFS)으로 바이러스 전파 시키기
var queue: Queue<Node> = Queue<Node>() // 큐 변수

// 이동하고자 하는 방향을 저장한 변수(상, 하, 좌, 우)
var dx: [Int] = [0, 0, -1, 1]
var dy: [Int] = [-1, 1, 0, 0]

// 바이러스 시작 위치를 큐에 삽입하기
var tmp: [Node] = []
for i in 0..<n {
    for j in 0..<n {
        // 시험관의 해당 위치에 바이러스가 존재하는 경우
        if testTube[i][j] != 0 {
            tmp.append(Node(testTube[i][j], i, j, second: 0))
        }
    }
}
tmp.sort { // 바이러스 번호를 기준으로 오름차순 정렬하기
    return $0.no < $1.no
}

tmp.forEach { queue.enqueue($0) } // 큐에 차례대로 삽입하기

// 큐가 비거나 설정된 초에 도달할 때까지 반복
while !queue.isEmpty {
    let node: Node = queue.dequeue()!
    
    // 최대 초에 도달한 경우
    if node.second == s {
        break // 루프 탈출
    }
    
    // 각 방향으로 이동하기
    for i in 0..<4 {
        let nx: Int = node.x + dx[i]
        let ny: Int = node.y + dy[i]
        
        // 새로운 좌표가 시험관 범위를 넘어서는 경우
        if nx < 0 || nx >= n || ny < 0 || ny >= n {
            continue
        }
        
        // 이미 방문한 경우
        if testTube[nx][ny] != 0 {
            continue
        }
        
        // 아직 방문하지 않은 경우
        if testTube[nx][ny] == 0 {
            queue.enqueue(Node(node.no, nx, ny, second: node.second+1))
            testTube[nx][ny] = node.no // 해당 위치 방문 표시
        }
    }
}
print(testTube[x-1][y-1]) // 결과값 출력
