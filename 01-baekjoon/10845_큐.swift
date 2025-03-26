import Foundation

final class LinkedQueue<T> {
    
    class LinkedQueueNode {
        var value: T
        var next: LinkedQueueNode?
        
        init(_ value: T) {
            self.value = value
        }
    }
    typealias Node = LinkedQueueNode
    
    private(set) var head: Node?
    private(set) var tail: Node?
    
    var size: Int {
        guard !isEmpty else { return 0 }
        
        var count = 1
        var nextNode = head?.next
        while let node = nextNode {
            nextNode = node.next
            count += 1
        }
        return count
    }
    
    var isEmpty: Bool {
        head == nil
    }
    
    func push(_ value: T) {
        let newNode = Node(value)
        push(newNode)
    }
    
    func push(_ newNode: Node) {
        
        if isEmpty {
            head = newNode
            tail = newNode
        } else {
            tail?.next = newNode
            tail = newNode
        }
    }
    
    func pop() -> T? {
        guard !isEmpty else { return nil }
        
        let removed = head
        head = removed?.next
        if head == nil { tail = nil }
        removed?.next = nil
        return removed?.value
    }
    
    var front: T? {
        head?.value
    }
    
    var back: T? {
        tail?.value
    }
}

// 명령어의 개수 N 입력 받기
let n = Int(readLine()!)!

let queue = LinkedQueue<Int>()

// N개만큼 명령어 입력 받기
for _ in 0..<n {
    let input = readLine()!
    // 명령어에 'push' 단어가 포함되어 있다면
    if input.contains("push") {
        let e = Int(input.split(separator: " ")[1])!
        queue.push(e)
        continue
    }
    
    // 명령어에 그 외 단어가 포함되어 있다면
    switch input {
    case "front":
        print(queue.front ?? -1)
    case "back":
        print(queue.back ?? -1)
    case "pop":
        print(queue.pop() ?? -1)
    case "size":
        print(queue.size)
    default: // "empty"
        print(queue.isEmpty ? 1 : 0)
    }
}
