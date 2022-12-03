import Foundation

public struct Queue<T> {
    fileprivate var array: [T?] = []
    fileprivate var head: Int = 0
    
    init() { }
    
    init(array: [T]) {
        for e in array {
            self.enqueue(e)
        }
    }
    
    public var isEmpty: Bool {
        return count == 0
    }
    
    public var count: Int {
        return array.count - head
    }
    
    public mutating func enqueue(_ element: T) {
        array.append(element)
    }
    
    @discardableResult public mutating func dequeue() -> T? {
        guard let element = array[guarded: head] else {
            return nil
        }
        
        array[head] = nil
        head += 1
        
        let percentage = Double(head) / Double(array.count)
        if array.count > 50 && percentage > 0.25 {
            array.removeFirst(head)
            head = 0
        }
        
        return element
    }
    
    var front: T? {
        guard !isEmpty else {
            return nil
        }
        
        return array[head]
    }
}

extension Array {
    subscript(guarded index: Int) -> Element? {
        guard (startIndex..<endIndex).contains(index) else {
            return nil
        }
        
        return self[index]
    }
}

let input: [Int] = readLine()!.split(separator: " ").map { Int(String($0))! }
var (n, m): (Int, Int) = (input[0], input[1])

var queue: Queue<Int> = Queue<Int>(array: Array(1...n))

var array: [Int] = []
while !queue.isEmpty {
    for _ in 0..<(m-1) {
        queue.enqueue(queue.dequeue()!)
    }
    
    array.append(queue.dequeue()!)
}

var result: String = "<"
for (n, x) in array.enumerated() {
    result += String(x)
    if n != array.count-1 { result += ", " }
}
print(result + ">")
