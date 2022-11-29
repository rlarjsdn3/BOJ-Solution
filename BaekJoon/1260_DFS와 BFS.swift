import Foundation

public struct Queue<T> {
    fileprivate var array: [T] = []
    
    public var count: Int {
        return array.count
    }
    
    public var isEmpty: Bool {
        return array.isEmpty
    }
    
    public mutating func enqueue(_ element: T) {
        array.append(element)
    }
    
    @discardableResult public mutating func dequeue() -> T? {
        guard !isEmpty else { return nil }
        
        return array.removeFirst()
    }
    
    public var front: T? {
        return array.first
    }
}

func bfs(_ graph: [[Int]], v: Int, visited: inout [Bool]) {
    var queue: Queue<Int> = Queue<Int>()
    
    visited[v] = true
    queue.enqueue(v)
    
    while !queue.isEmpty {
        let p: Int = queue.dequeue()!
        print(p, terminator: " ")
        
        for i in graph[p] {
            if !visited[i] {
                queue.enqueue(i)
                visited[i] = true
            }
        }
    }
}

func dfs(_ graph: [[Int]], v: Int, visited: inout [Bool]) {
    visited[v] = true
    print(v, terminator: " ")
    
    for i in graph[v] {
        if !visited[i] {
            dfs(graph, v: i, visited: &visited)
        }
    }
}

let input: [Int] = readLine()!.split(separator: " ").map { Int(String($0))! }
let (n, m, r) = (input[0], input[1], input[2])

var visited: [Bool] = []
var graph: [[Int]] = [[Int]](repeating: [Int](), count: n + 1)
for _ in 0..<m {
    let input: [Int] = readLine()!.split(separator: " ").map { Int(String($0))! }
    let (u, v) = (input[0], input[1])
    graph[u].append(v)
    graph[v].append(u)
}
for i in 1..<(n+1) {
    graph[i].sort()
}

visited = [Bool](repeating: false, count: n + 1)
dfs(graph, v: r, visited: &visited)
print()

visited = [Bool](repeating: false, count: n + 1)
bfs(graph, v: r, visited: &visited)
print()
