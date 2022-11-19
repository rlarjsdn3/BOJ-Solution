import Foundation

class Node<T> {
    var data: T
    var next: Node?
    
    init(_ node: T, next: Node? = nil) {
        self.data = node
        self.next = next
    }
}

class Queue<T: Numeric> {
    private var front: Node<T>?
    private var rear: Node<T>?
    private var count: Int = 0
    
    var isEmpty: Bool {
        count == 0
    }
    
    var size: Int {
        count
    }
    
    init(front: Node<T>? = nil, rear: Node<T>? = nil) {
        self.front = front
        self.rear = rear
    }
    
    func enqueue(_ element: T) {
        let newNode: Node = Node(element)
        
        if isEmpty {
            front = newNode
        } else {
            rear?.next = newNode
        }
        rear = newNode
        count += 1
    }
    
    func dequeue() -> T {
        if isEmpty {
            return -1
        }
        
        let tmp: Node! = front
        front = front?.next
        count -= 1
        return tmp.data
    }
}

var n: Int = Int(readLine()!)!
var queue: Queue<Int> = Queue<Int>()
for i in 1...n {
    queue.enqueue(i)
}

while queue.size != 1 {
    _ = queue.dequeue()
    queue.enqueue(queue.dequeue())
}
print(queue.dequeue())
