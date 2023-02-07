import Foundation

// 힙(Heap) 자료구조
public struct Heap<T> {
    var nodes: [T] = []
    
    // '>'는 최대-힙, '<'는 최소-힙
    private var orderCriteria: (T, T) -> Bool
    
    public init(sort: @escaping (T, T) -> Bool) {
        self.orderCriteria = sort
    }
    
    public init(array: [T], sort: @escaping (T, T) -> Bool) {
        self.orderCriteria = sort
        configureHeap(from: array)
    }
    
    private mutating func configureHeap(from array: [T]) {
        nodes = array
        for i in stride(from: (nodes.count/2-1), through: 0, by: -1) {
            shiftDown(i)
        }
    }
    
    public var isEmpty: Bool {
        return nodes.isEmpty
    }
    
    public var count: Int {
        return nodes.count
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
    
    public func peek() -> T? {
        return nodes.first
    }
    
    public mutating func insert(_ value: T) {
        nodes.append(value)
        shiftUp(nodes.count - 1)
    }
    
    public mutating func insert<S: Sequence>(_ sequence: S) where S.Iterator.Element == T {
        for value in sequence {
            insert(value)
        }
    }
    
    public mutating func replace(index i: Int, value: T) {
        guard i < nodes.count else { return }
        
        remove(at: i)
        insert(value)
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
    
    @discardableResult public mutating func remove(at index: Int) -> T? {
        guard index < nodes.count else { return nil }
        
        let size: Int = nodes.count - 1
        if index != size {
            nodes.swapAt(index, size)
            shiftDown(from: index, until: size)
            shiftUp(index)
        }
        return nodes.removeLast()
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

extension Heap where T: Equatable {
    public func index(of node: T) -> Int? {
        return nodes.firstIndex(where: { $0 == node })
    }
    
    @discardableResult public mutating func remove(node : T) -> T? {
        if let index: Int = index(of: node) {
            return remove(at: index)
        }
        
        return nil
    }
}

// 우선순위 큐(PriorityQueue) 자료구조
public struct PriorityQueue<T> {
    fileprivate var heap: Heap<T>
    
    /*
     To create a max-priority queue, supply a > sort function. For a min-priority
     queue, use <.
     */
    public init(sort: @escaping (T, T) -> Bool) {
        heap = Heap(sort: sort)
    }
    
    public var isEmpty: Bool {
        return heap.isEmpty
    }
    
    public var count: Int {
        return heap.count
    }
    
    public func peek() -> T? {
        return heap.peek()
    }
    
    public mutating func enqueue(_ element: T) {
        heap.insert(element)
    }
    
    public mutating func dequeue() -> T? {
        return heap.remove()
    }
}

let INF = 10_000_000_000

// 헛간의 수 N과 경로의 개수 M 입력 받기
let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let (n, m) = (input[0], input[1])
// M개의 경로 정보 입력 받기
var graph = [[(node: Int, distance: Int)]](repeating: [(Int, Int)](), count: n + 1)
for _ in 0..<m {
    let input = readLine()!.split(separator: " ").map { Int(String($0))! }
    // input[0]에서 input[1]로 가는 경로의 비용은 input[2] (양방향 그래프)
    graph[input[0]].append((input[1], input[2]))
    graph[input[1]].append((input[0], input[2]))
}

// 최소 비용 거리 정보를 저장
var distance = [Int](repeating: INF, count: n + 1)

// 노드 구조체
struct Node {
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

func dijkstra(_ start: Int) {
    var priorityQueue = PriorityQueue<Node>(sort: <)
    // 최초 시작 노드 초기화하기
    priorityQueue.enqueue(Node(start, 0))
    distance[start] = 0
    
    while !priorityQueue.isEmpty {
        // 가장 최단 거리가 짧은 노드에 대한 정보 꺼내기
        let now = priorityQueue.dequeue()!
        // 현재 노드에 저장된 거리가 더 짧은 경우
        if distance[now.node] < now.distance {
            continue
        }
        // 현재 노드에 인접한 다른 노드들을 확인
        for i in graph[now.node] {
            let cost = now.distance + i.distance
            // now 노드를 경유하는 경로가 직진하는 경로보다 더 빠른 경우
            if cost < distance[i.node] {
                distance[i.node] = cost
                priorityQueue.enqueue(Node(i.node, cost))
            }
        }
    }
}

// 다익스트라 알고리즘 수행
dijkstra(1)

// 결과값 출력하기
print(distance[n])
