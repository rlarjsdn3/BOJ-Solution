import Foundation

// 링크드 큐(LinkedQueue) 구현
final class LinkedQueue<T> {
    
    class LinkedQueueNode {
        var value: T
        var flag: Bool = false
        var next: LinkedQueueNode?
        var prev: LinkedQueueNode?
        
        init(_ value: T) {
            self.value = value
        }
    }
    typealias Node = LinkedQueueNode
    
    private(set) var head: Node?
    private(set) var tail: Node?
    
    var isEmpty: Bool {
        return head == nil
    }
    
    var count: Int {
        guard !isEmpty else { return 0 }
        
        var count = 1
        var nextNode = head?.next
        while let node = nextNode {
            nextNode = node.next
            count += 1
        }
        return count
    }
    
    subscript(index: Int) -> T? {
        return node(at: index)
    }
    
    func node(at index: Int) -> T? {
        assert(!isEmpty, "Queue is empty")
        
        var node = head
        for _ in 0..<index {
            node = node?.next
            if node == nil {
                break
            }
        }
        
        assert(node != nil, "Index out of bounds")
        return node?.value
    }
    
    @discardableResult func enqueue(_ value: T) -> Node {
        let node = Node(value)
        enqueue(node)
        return node
    }
    
    func enqueue(_ node: Node) {
        if head == nil {
            head = node
            tail = node
        } else {
            tail?.next = node
            node.prev = tail
            tail = node
        }
    }
    
    @discardableResult func dequeue() -> Node? {
        guard !isEmpty else { return nil }

        let removed = head
        head = removed?.next
        head?.prev = nil
        removed?.next = nil
        
        if head == nil { tail = nil }
        return removed
    }
}

// 테스트 케이스의 수 T 입력 받기
let t = Int(readLine()!)!

for _ in 0..<t {
    // 문서의 개수 N과 질의 문서 M 입력 받기
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    let (n, m) = (input[0], input[1])
    // 인쇄 문서의 우선순위 입력 받기
    let array = readLine()!.split(separator: " ").map { Int($0)! }
    // 우선순위를 큐에 차례대로 삽입하기
    let priorities = LinkedQueue<Int>()
    for (index, priority) in array.enumerated() {
        let node = priorities.enqueue(priority)
        if index == m { node.flag = true }
    }
    
    var count = 0
    
    // 큐가 빌 때까지 반복
    while !priorities.isEmpty {
        // 실제로 요소 제거 여부 확인
        var hasEnqueued = true
        // 큐에서 요소 하나 꺼내기
        let removed = priorities.dequeue()!
        // 큐의 요소를 순회하면서
        for i in 0..<priorities.count {
            let priority = removed.value
            // 꺼낸 요소 뒤에 더 높은 우선순위 요소가 있다면
            if priority < priorities[i]! {
                hasEnqueued = false
                priorities.enqueue(removed) // 꺼낸 요소를 다시 맨 뒤에 넣기
                break
            }
        }
        
        // 실제로 큐가 제거되었다면
        if hasEnqueued {
            count += 1
            // 제거된 요소가 플래그 요소라면
            if removed.flag {
                print(count) // 결과 답안 출력
                break
            }
        }
    }
}
