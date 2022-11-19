struct Stack<T: Numeric> {
    var items: [T] = []
    
    mutating func push(_ element: T) {
        items.append(element)
    }
    
    mutating func pop() -> T {
        if empty() == 1 {
            return -1
        }
        
        return items.removeLast()
    }
    
    func top() -> T {
        if empty() == 1 {
            return -1
        }
        
        return items.last!
    }
    
    func empty() -> Int {
        return items.isEmpty ? 1 : 0
    }
    
    func size() -> Int {
        return items.count
    }
}

let n: Int = Int(readLine()!)!
var input: [[String]] = []
for _ in 0..<n {
    input.append(readLine()!.split(separator: " ").map { String($0) })
}

var result: [Int] = []
var stack: Stack<Int> = Stack<Int>()
for i in input.indices {
    switch input[i][0] {
    case "push":
        stack.push(Int(input[i][1])!)
    case "pop":
        result.append(stack.pop())
    case "top":
        result.append(stack.top())
    case "size":
        result.append(stack.size())
    case "empty":
        result.append(stack.empty())
    default:
        continue
    }
}

result.forEach { print($0) }
