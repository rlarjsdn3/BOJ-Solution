//
//  Created by 김건우 on 2022/11/13.
//

import Foundation

struct Deque<T: Numeric> {
    var items: [T] = []
    var size: Int {
        items.count
    }
    var isEmpty: Int {
        items.count == 0 ? 1 : 0
    }
    
    mutating func pushFront(_ element: T) {
        items.insert(element, at: 0)
    }
    
    mutating func pushBack(_ element: T) {
        items.append(element)
    }
    
    mutating func popFront() -> T {
        if isEmpty == 1 {
            return -1
        }
        
        return items.removeFirst()
    }
    
    mutating func popLast() -> T {
        if isEmpty == 1 {
            return -1
        }
        
        return items.removeLast()
    }
    
    func front() -> T {
        if isEmpty == 1 {
            return -1
        }
        
        return items.first!
    }
    
    func back() -> T {
        if isEmpty == 1 {
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
var deque: Deque<Int> = Deque<Int>()
for s in input {
    switch s[0] {
    case "push_front":
        deque.pushFront(Int(s[1])!)
    case "push_back":
        deque.pushBack(Int(s[1])!)
    case "pop_front":
        result.append(deque.popFront())
    case "pop_back":
        result.append(deque.popLast())
    case "size":
        result.append(deque.size)
    case "empty":
        result.append(deque.isEmpty)
    case "front":
        result.append(deque.front())
    case "back":
        result.append(deque.back())
    default:
        continue
    }
}
result.forEach { print($0) }
