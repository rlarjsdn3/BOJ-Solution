import Foundation

// 노드 구조체
public struct Node {
    var r, c: Int
    var moveCount: Int
    
    init(_ r: Int, _ c: Int, moveCount: Int = 0) {
        self.r = r
        self.c = c
        self.moveCount = moveCount
    }
}

// 큐(Queue) 자료구조
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

// 체스판의 크기 N 입력 받기
let n = Int(readLine()!)!

// 데스나이트의 위치(r1, c1)과 목적지 위치(r2, c2) 입력 받기
let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let (r1, c1, r2, c2) = (input[0], input[1], input[2], input[3])

// 데스나이트의 이동 방향
let dr = [-2, -2, +0, +0, +2, +2]
let dc = [-1, +1, -2, +2, -1, +1]

// 탐색 성공 여부를 저장
var result = -1

// 방문 여부를 저장
var visited: [[Bool]] = [[Bool]](repeating: [Bool](repeating: false, count: n + 1), count: n + 1)

// 너비 우선 탐색(BFS) 수행
var queue = Queue<Node>()
queue.enqueue(Node(r1, c1))

while !queue.isEmpty {
    let node = queue.dequeue()!
    // 목적지에 도착한 경우
    if node.r == r2 && node.c == c2 {
        result = node.moveCount; break
    }
    
    for i in 0..<6 {
        let nr = node.r + dr[i]
        let nc = node.c + dc[i]
        
        // 체스판의 범위를 벗어난 경우
        if nr < 0 || nr >= n || nc < 0 || nc >= n {
            continue
        }
        
        // 해당 위치에 방문하지 않은 경우
        if !visited[nr][nc] {
            queue.enqueue(Node(nr, nc, moveCount: node.moveCount + 1))
            visited[nr][nc] = true
        }
    }
}
print(result) // 결과값 출력하기
