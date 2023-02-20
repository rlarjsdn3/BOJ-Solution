import Foundation

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

// 노드의 개수 N 입력 받기
let n = Int(readLine()!)!
// 트리의 정보 입력받기
var tree = [[Int]](repeating: [Int](), count: n + 1)
for _ in 0..<(n-1) {
    let input = readLine()!.split(separator: " ").map { Int(String($0))! }
    // input[0]의 부모 노드가 input[1]이라는 의미
    tree[input[0]].append(input[1])
    tree[input[1]].append(input[0])
}

// 노드의 방문 여부를 확인하는 변수
var visited = [Bool](repeating: false, count: n + 1)
// 부모 노드 정보를 저장하는 변수
var parent = [Int](repeating: 0, count: n + 1)
// BFS를 위한 큐 구조체 변수
var queue = Queue<Int>()

// 너비 우선 탐색(BFS) 수향
queue.enqueue(1)
visited[1] = true

while !queue.isEmpty {
    let now = queue.dequeue()!
    
    for i in tree[now] where !visited[i] {
        queue.enqueue(i)
        visited[i] = true
        parent[i] = now
    }
}

// 결과값 출력하기
for i in 2..<(n+1) {
    print(parent[i])
}
