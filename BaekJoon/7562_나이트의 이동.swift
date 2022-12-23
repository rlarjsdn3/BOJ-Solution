import Foundation

// 그래프 노드 구조체
public struct Node {
    var x: Int
    var y: Int
    var count: Int
    
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
    
    public var isEmpty: Bool {
        return count == 0
    }
    
    public var count: Int {
        return array.count
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

let t: Int = Int(readLine()!)! // 테스트 케이스의 개수 입력 받기

var result: [Int] = [] // 결과값을 저장하는 변수
for _ in 0..<t {
    var l: Int = Int(readLine()!)! // 체스판 한 변의 길이 입력 받기
    
    // 현재 나이트의 위치 좌표 입력 받기
    var input: [Int] = readLine()!.split(separator: " ").map { Int(String($0))! }
    let (x, y): (Int, Int) = (input[0], input[1])
    
    // 목적지 나이트의 위치 좌표 입력 받기
    input = readLine()!.split(separator: " ").map { Int(String($0))! }
    let (a, b): (Int, Int) = (input[0], input[1])
    
    // 나이트의 이동 방향을 저장하는 변수
    let dx: [Int] = [+1, -1, +1, -1, +2, -2, +2, -2]
    let dy: [Int] = [+2, +2, -2, -2, +1, +1, -1, -1]
    
    var chessBoard: [[Int]] = [[Int]](repeating: [Int](repeating: 0, count: l), count: l)
    
    // 너비 우선 탐색으로 나이트의 최소 이동 거리 파악하기
    var queue: Queue<Node> = Queue<Node>()
    queue.enqueue(Node(x, y, count: 0))
    chessBoard[x][y] = 1 // 해당 위치 벙문 표시
    
    while !queue.isEmpty {
        let node: Node = queue.dequeue()!
        
        // 나이트가 목적지에 도착하는 경우
        if node.x == a && node.y == b {
            result.append(node.count) // 최소 이동 횟수 저장하기
            break // 루프 탈출하기
        }
        
        for i in 0..<8 {
            // 이동하게 될 새로운 좌표 계산
            let nx: Int = node.x + dx[i]
            let ny: Int = node.y + dy[i]
            
            // 새로운 좌표가 체스판의 범위를 벗어나는 경우
            if nx < 0 || nx >= l || ny < 0 || ny >= l {
                continue
            }
            
            // 해당 위치에 방문하지 않은 경우
            if chessBoard[nx][ny] == 0 {
                queue.enqueue(Node(nx, ny, count: node.count + 1))
                chessBoard[nx][ny] = 1 // 해당 위치 방문 표시 (중복 삽입을 방지하기 위해 지금 방문 표시함)
            }
        }
    }
}
result.forEach { print($0) } // 결과값 출력
