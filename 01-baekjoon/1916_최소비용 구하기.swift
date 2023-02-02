import Foundation

public struct Node {
    var node: Int
    var distance: Int
    
    init(_ node: Int, _ distance: Int) {
        self.node = node
        self.distance = distance
    }
}

extension Node: Comparable {
    public static func < (lhs: Node, rhs: Node) -> Bool {
        return lhs.distance < rhs.distance
    }
}

public struct PriorityQueue<T> {
  fileprivate var heap: Heap<T>

  public init(sort: @escaping (T, T) -> Bool) {
    heap = Heap(sort: sort)
  }

  public var isEmpty: Bool {
    return heap.isEmpty
  }

  public mutating func enqueue(_ element: T) {
    heap.insert(element)
  }

  public mutating func dequeue() -> T? {
    return heap.remove()
  }
}

public struct Heap<T> {
    var nodes: [T] = []
    
    private var orderCriteria: (T, T) -> Bool
    
    public init(sort: @escaping (T, T) -> Bool) {
        self.orderCriteria = sort
    }
    
    public var isEmpty: Bool {
        return nodes.isEmpty
    }
    
    @inline(__always) internal func parentIndex(ofIndex i: Int) -> Int {
        return (i - 1) / 2
    }
    
    @inline(__always) internal func leftChildIndex(ofIndex i: Int) -> Int {
        return (i * 2) + 1
    }
    
    @inline(__always) internal func rightChildIndex(ofIndex i: Int) -> Int {
        return (i * 2) + 2
    }
    
    public mutating func insert(_ value: T) {
        nodes.append(value)
        shiftUp(nodes.count - 1)
    }
    
    @discardableResult public mutating func remove() -> T? {
        guard !nodes.isEmpty else { return nil }
        
        if nodes.count == 1 {
            return nodes.removeLast()
        } else {
            let value: T = nodes[0]
            nodes[0] = nodes.removeLast()
            shiftDown(0)
            return value
        }
    }
    
    internal mutating func shiftUp(_ index: Int) {
        var childIndex: Int = index
        let child: T = nodes[childIndex]
        var parentIndex: Int = self.parentIndex(ofIndex: index)
        
        while childIndex > 0 && orderCriteria(child, nodes[parentIndex]) {
            nodes[childIndex] = nodes[parentIndex]
            childIndex = parentIndex
            parentIndex = self.parentIndex(ofIndex: childIndex)
        }
        
        nodes[childIndex] = child
    }
    
    internal mutating func shiftDown(from index: Int, until endIndex: Int) {
        let leftChildIndex: Int = self.leftChildIndex(ofIndex: index)
        let rightChildIndex: Int = leftChildIndex + 1
        
        var first: Int = index
        if leftChildIndex < endIndex && orderCriteria(nodes[leftChildIndex], nodes[first]) {
            first = leftChildIndex
        }
        if rightChildIndex < endIndex && orderCriteria(nodes[rightChildIndex], nodes[first]) {
            first = rightChildIndex
        }
        if first == index { return }
        
        nodes.swapAt(index, first)
        shiftDown(from: first, until: endIndex)
    }
    
    internal mutating func shiftDown(_ index: Int) {
        shiftDown(from: index, until: nodes.count)
    }
}

let INF = 10_000_000_000

// 노드의 개수, 간선의 개수 입력 받기
let v = Int(readLine()!)!
let e = Int(readLine()!)!
// 각 노드에 연결되어 있는 노드에 대한 정보를 담는 리스트를 만들기
var graph = [[(node: Int, distance: Int)]](repeating: [(Int, Int)](), count: v + 1)
// 최단 거리 테이블을 모두 무한으로 초기화
var distance = [Int](repeating: INF, count: v + 1)

// 모든 간선 정보 입력 받기
for _ in 0..<e {
    let input = readLine()!.split(separator: " ").map { Int(String($0))! }
    // input[0]번 노드에서 input[1]번 노드로 가는 비용이 input[2]라는 의미
    graph[input[0]].append((input[1], input[2]))
}

// 시작 노드 번호와 끝 노드 번호 입력 받기
let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let (start, end) = (input[0], input[1])

func dijkstra(_ start: Int) {
    var priorityQueue = PriorityQueue<Node>(sort: <)
    //  시작 노드로 가기 위한 최단 경로는 0으로 설정하여, 큐에 삽입
    priorityQueue.enqueue(Node(start, 0))
    distance[start] = 0
    // 큐가 비어 있지 않다면
    while !priorityQueue.isEmpty {
        // 가장 최단 거리가 짧은 노드에 대한 정보 꺼내기
        let now = priorityQueue.dequeue()!
        // 현재 노드가 이미 처리된 적이 있는 노드라면 무시
        if distance[now.node] < now.distance {
            continue
        }
        // 현재 노드와 연결된 다른 인접한 노드들을 확인
        for i in graph[now.node] {
            let cost = now.distance + i.distance
            // 현재 노드를 거쳐서, 다른 노드로 이동하는 거리가 더 짧은 경우
            if cost < distance[i.node] {
                distance[i.node] = cost
                priorityQueue.enqueue(Node(i.node, cost))
            }
        }
    }
}

// 다익스트라 알고리즘 수행
dijkstra(start)

// 시작 노드에서 끝 노드까지 최단 거리 출력하기
print(distance[end])
