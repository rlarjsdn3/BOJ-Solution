import Foundation

// 그래프 노드 구조체
struct Node {
    var now: Int // 현재 값을 저장하는 변수
    var count: Int // 횟수를 저장하는 변수
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
        guard !array.isEmpty else {
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

// 정수 A, B 입력 받기
let input: [Int] = readLine()!.split(separator: " ").map { Int(String($0))! }
let (a, b): (Int, Int) = (input[0], input[1])

// 너비 우선 탐색(BFS)으로 A에서 B로 바꾸는 게 가능한지 알아보기
var queue: Queue<Node> = Queue<Node>()
queue.enqueue(Node(now: a, count: 1))

var check: Bool = false // 결과값을 찾았는지 알아내는 변수

while !queue.isEmpty {
    let node: Node = queue.dequeue()!
    
    // 뽑아낸 노드가 정수 b와 같은 경우
    if node.now == b {
        print(node.count) // 결과값 출력하고
        check = true
        break // 루프 탈출하기
    }
    
    // 뽑아낸 노드가 정수 b보다 큰 경우
    if node.now > b {
        continue
    }
    
    queue.enqueue(Node(now: Int("\(node.now)" + "1")!, count: node.count + 1))
    queue.enqueue(Node(now: node.now * 2, count: node.count + 1))
}

// 결과값을 찾지 못한 경우
if !check {
    print(-1)
}
