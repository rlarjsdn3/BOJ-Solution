import Foundation

struct Queue<T> {
    private var items: [T] = []
    var isEmpty: Bool {
        return items.isEmpty
    }
    
    mutating func push(_ element: T) {
        items.append(element)
    }
    
    mutating func pop() -> T? {
        if isEmpty {
            return nil
        }
        
        return items.removeFirst()
    }
}

let input: [Int] = readLine()!.split(separator: " ").map { Int(String($0))! }
let n: Int = input[0]
let k: Int = input[1]
var queue: Queue<Int> = Queue<Int>()
for i in 1...n {
    queue.push(i)
}

var result: [String] = []
while !queue.isEmpty {
    for _ in 0..<(k-1) {
        if let q = queue.pop() {
            queue.push(q)
        }
    }
    
    result.append(String(queue.pop()!))
}
print("<" + result.joined(separator: ", ") + ">")
