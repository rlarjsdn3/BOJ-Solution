import Foundation

// 히프 자료구조에 저장할 요소
struct Element {
    var distance: Int
    var node: Int
    
    init(_ distance: Int, _ node: Int) {
        self.distance = distance
        self.node = node
    }
}

extension Element: Comparable {
    static func < (lhs: Element, rhs: Element) -> Bool {
        return lhs.distance < rhs.distance
    }
}

// 히프 구조체
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

// 우선순위 큐 구조체
public struct PriorityQueue<T> {
  fileprivate var heap: Heap<T>

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

  public mutating func changePriority(index i: Int, value: T) {
    return heap.replace(index: i, value: value)
  }
}

let INF: Int = 10_000_000_000 // 무한을 의미하는 값으로 10억을 설정

// 노드의 개수, 간선의 개수를 입력 받기
let input: [Int] = readLine()!.split(separator: " ").map { Int(String($0))! }
let (n, m): (Int, Int) = (input[0], input[1])
// 시작 노드 번호를 입력 받기
let start: Int = Int(readLine()!)!
// 각 노드에 연결되어 있는 노드에 대한 정보를 담는 2차원 배열을 만들기
var graph: [[(node: Int, distance: Int)]] = [[(Int, Int)]](repeating: [(Int, Int)](), count: n + 1)
// 방문한 적이 있는지 체크하는 목적의 배열 만들기
var visited: [Bool] = [Bool](repeating: false, count: n + 1)
// 최단 거리 테이블을 모두 INF로 초기화하기
var distance: [Int] = [Int](repeating: INF, count: n + 1)

// 모든 간선 정보를 입력받기
for _ in 0..<m {
    let input: [Int] = readLine()!.split(separator: " ").map { Int(String($0))! }
    let (a, b, c): (Int, Int, Int) = (input[0], input[1], input[2])
    // a번 노드에서 b번 노드로 가는 비용이 c라는 의미
    graph[a].append((b, c))
}

func dijkstra(_ start: Int) {
    var priorityQueue: PriorityQueue<Element> = PriorityQueue<Element>(sort: <)
    // 시작 노드에 대해서 초기화
    priorityQueue.enqueue(Element(0, start))
    distance[start] = 0
    // 큐가 비어있지 않다면
    while !priorityQueue.isEmpty {
        // 가장 최단 거리가 짧은 노드에 대한 정보 꺼내기
        let element: Element = priorityQueue.dequeue()!
        // 현재 노드가 이미 처리된 적이 있는 노드라면 무시
        if distance[element.node] < element.distance {
            continue
        }
        // 현재 노드와 연결된 다른 인접한 노드들을 확인
        for i in graph[element.node] {
            let cost: Int = element.distance + i.distance
            // 현재 노드를 거쳐서, 다른 노드로 이동하는 거리가 더 짧은 경우
            if cost < distance[i.node] {
                distance[i.node] = cost
                priorityQueue.enqueue(Element(cost, i.node))
            }
        }
    }
}

// 다익스트라 알고리즘 수행
dijkstra(start)

// 모든 노드로 가기 위한 최단 거리 출력하기
for i in 1...n {
    // 도달할 수 없는 경우, 무한이라고 출력
    if distance[i] == INF {
        print("INF")
    } else {
        print(distance[i])
    }
}
