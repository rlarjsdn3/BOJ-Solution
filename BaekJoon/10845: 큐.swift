//
//  Created by 김건우 on 2022/11/10.
//

struct Queue<T: Numeric> {
    var items: [T] = []
    
    mutating func push(_ element: T) {
        items.append(element)
    }
    
    mutating func pop() -> T {
        if empty() == 1{
            return -1
        }
        
        return items.removeFirst()
    }
    
    func size() -> Int {
        return items.count
    }
    
    func empty() -> Int {
        return items.isEmpty ? 1 : 0
    }
    
    func front() -> T {
        if empty() == 1 {
            return -1
        }
        
        return items.first!
    }
    
    func back() -> T {
        if empty() == 1 {
            return -1
        }
        
        return items.last!
    }
}

let n: Int = Int(readLine()!)!
var input: [[String]] = []
for _ in 0..<n {
    input.append(readLine()!.split(separator: " ").map { String($0) })
}

var result: [Int] = []
var queue: Queue<Int> = Queue<Int>()
for i in input.indices {
    switch input[i][0] {
    case "push":
        queue.push(Int(input[i][1])!)
    case "pop":
        result.append(queue.pop())
    case "size":
        result.append(queue.size())
    case "empty":
        result.append(queue.empty())
    case "front":
        result.append(queue.front())
    case "back":
        result.append(queue.back())
    default:
        continue
    }
}

result.forEach { print($0) }
