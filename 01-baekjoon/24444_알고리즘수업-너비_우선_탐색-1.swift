import Foundation

final class LinkedQueue<T> {
    
    class LinkedQueueNode {
        var value: T
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
        head == nil
    }
    
    func enqueue(_ value: T) {
        let newNode = Node(value)
        enqueue(newNode)
    }
    
    func enqueue(_ newNode: Node) {
        if head == nil {
            head = newNode
            tail = newNode
        } else {
            tail?.next = newNode
            newNode.prev = tail
            tail = newNode
        }
    }
    
    func dequeue() -> T? {
        assert(!isEmpty, "Queue is empty.")
        
        let removed = head
        head = removed?.next
        head?.prev = nil
        removed?.next = nil
        return removed?.value
    }
}
extension LinkedQueue {
    
    convenience init(array: [T]) {
        self.init()
        array.forEach { enqueue($0) }
    }
}

typealias Graph = [[Int]]

// 너비 우선 탐색(BFS) 정의
func bfs(_ graph: Graph, _ v: Int, _ visited: inout [Int]) {
    // 시작 노드를 큐에 삽입
    let queue = LinkedQueue(array: [v])
    // 시작 노드 방문 처리
    visited[v] = order
    
    // 큐가 빌 때까지
    while !queue.isEmpty {
        // 큐에서 요소 하나 빼기
        let v = queue.dequeue()!
        // 해당 요소에 인접한 노드를 방문하지 않았다면
        for i in graph[v] where visited[i] == 0 {
            queue.enqueue(i) // 해당 노드를 큐에 삽입
            order += 1
            visited[i] = order // 노드 방문 처리
        }
    }
    
}

// 정점의 수 N, 간선의 수 M과 시작 정점 R 입력 받기
let input = readLine()!.split(separator: " ").map { Int($0)! }
let (n, m, r) = (input[0], input[1], input[2])
// 간선 연결 리스트로 그래프 그리기
var graph = Graph(repeating: [], count: n + 1)
// 간선 정보 U, V 입력 받기
for _ in 0..<m {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    let (u, v) = (input[0], input[1])
    graph[u].append(v)
    graph[v].append(u)
}

// 모든 인접 간선들의 순서를 오름차순으로 정렬
for (index, adjacencyNodes) in graph.enumerated() {
    graph[index] = adjacencyNodes.sorted()
}

var order: Int = 1
// 방문 노드 처리를 위한 배열
var visited = [Int](repeating: 0, count: n + 1)

// 너비 우선 탐색 수행
bfs(graph, r, &visited)

// 답안 결과 출력
(1..<n+1).forEach { print(visited[$0]) }
