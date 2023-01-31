import Foundation

public struct Node {
    var pos: Int
    var count: Int
}

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

let input: [Int] = readLine()!.split(separator: " ").map { Int(String($0))! }
let (n, k): (Int, Int) = (input[0], input[1])

// BFS를 구현하기 위한 큐
var queue: Queue<Node> = Queue<Node>()
queue.enqueue(Node(pos: n, count: 0))

// 노드의 방문 여부를 확인하는 변수
var visited: [Bool] = [Bool](repeating: false, count: 200_001)

// 결과를 저장하기 위한 변수
var result: Int = 0

// 너비 우선 탐색 수행
while !queue.isEmpty {
    let n: Node = queue.dequeue()!
    // 술래 위치에 도달한 경우
    if n.pos == k {
        result = n.count // 결과 저장 후
        break // 루프 탈출
    }
    
    // 인접 노드 방문 방향을 저장한 변수
    let d: [Int] = [n.pos + 1, n.pos - 1, n.pos * 2]
    
    // 술래 찾아내기
    for  i in d {
        // 해당 노드가 좌표 범위를 벗어나는 경우
        if i < 0 || i >= visited.count {
            continue
        }
        
        if !visited[i] {
            queue.enqueue(Node(pos: i, count: n.count + 1))
            visited[i] = true
        }
    }
}
print(result) // 결과 출력
