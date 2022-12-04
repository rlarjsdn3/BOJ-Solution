import Foundation

public struct Document {
    var index: Int
    var priority: Int
}

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

extension Queue: Sequence {
    public func makeIterator() -> AnyIterator<T> {
        var curr: Queue<T> = self
        return AnyIterator {
            curr.dequeue()
        }
    }
}

extension Queue where T == Document {
    public func maxPriority() -> Int? {
        return self.max { $0.priority < $1.priority }?.priority ?? nil
    }
}

let n: Int = Int(readLine()!)!
var result: [Int] = []
for _ in 0..<n {
    let input: [Int] = readLine()!.split(separator: " ").map { Int(String($0))! }
    let (_, m): (Int, Int) = (input[0], input[1])
    
    let array: [Int] = readLine()!.split(separator: " ").map { Int(String($0))! }
    var queue: Queue<Document> = Queue<Document>()
    for (n, x) in array.enumerated() {
        queue.enqueue(Document(index: n, priority: x))
    }
    
    var count: Int = 0
    while let front: Document = queue.front {
        if front.priority == queue.maxPriority() {
            count += 1
            if let index: Int = queue.dequeue()?.index {
                if index == m {
                    result.append(count)
                    break
                }
            }
        } else {
            queue.enqueue(queue.dequeue()!)
        }
    }
}
result.forEach { print($0) }

