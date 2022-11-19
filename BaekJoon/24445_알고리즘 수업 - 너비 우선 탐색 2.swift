import Foundation

class Node<T> {
    var data: T?
    var next: Node?
    
    init(data: T?, next: Node? = nil) {
        self.data = data
        self.next = next
    }
}

class LinkedQueue<T> {
    private var head: Node<T>?
    private var tail: Node<T>?
    
    var isEmpty: Bool {
        return head == nil && tail == nil
    }
    
    func enqueue(_ element: T) {
        if isEmpty {
            head = Node(data: element)
            tail = head
            return
        }
        
        let newNode = Node(data: element)
        tail?.next = newNode
        tail = newNode
    }
    
    func dequeue() -> T? {
        guard !isEmpty else { return nil }
        
        let removed: Node<T>? = head
        head = head?.next
        if head == nil {
            tail = nil
        }
        
        return removed?.data
    }
}

var count: Int = 1
func bfs(_ graph: [[Int]], v: Int, visited: inout [Int]) {
    let queue: LinkedQueue<Int> = LinkedQueue<Int>()
    
    visited[v] = count
    queue.enqueue(v)
    while !queue.isEmpty {
        if let u = queue.dequeue() {
            for v in graph[u] {
                if visited[v] == 0 {
                    count += 1
                    visited[v] = count
                    queue.enqueue(v)
                }
            }
        }
    }
}

let input: [Int] = readLine()!.split(separator: " ").map { Int(String($0))! }
let n: Int = input[0]
let m: Int = input[1]
let r: Int = input[2]

var graph: [[Int]] = [[Int]](repeating: [Int](), count: n+1)
for _ in 0..<m {
    let input: [Int] = readLine()!.split(separator: " ").map { Int(String($0))! }
    let u: Int = input[0]
    let v: Int = input[1]
    graph[u].append(v)
    graph[v].append(u)
}
for i in 0..<(n+1) {
    graph[i].sort(by: >)
}

var visited: [Int] = [Int](repeating: 0, count: n+1)

bfs(graph, v: r, visited: &visited)
for i in 1..<(n+1) {
    print(visited[i])
}
