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

let n: Int = Int(readLine()!)!

var heap: Heap<Int> = Heap<Int>(sort: <) // 최소-힙 선언
for _ in 0..<n {
    let input: Int = Int(readLine()!)!
    // input이 0이 아닌 경우
    if input != 0 {
        heap.insert(input) // 힙에 요소 삽입
    } else {
        // input이 0인 이고, 힙에서 요소를 삭제할 수 있는 경우
        if let removed = heap.remove() {
            // 삭제한 요소 출력
            print(removed)
        } else {
            // 그렇지 못하면 0 출력
            print(0)
        }
    }
}
