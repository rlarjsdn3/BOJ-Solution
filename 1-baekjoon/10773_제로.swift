struct Stack<T: Numeric> {
    var items: [T] = []
    
    mutating func push(_ element: T) {
        items.append(element)
    }
    
    mutating func pop() -> T {
        return items.popLast()!
    }
    
    func sum() -> T {
        items.reduce(0, +)
    }
}

let n: Int = Int(readLine()!)!
var stack: Stack<Int> = Stack<Int>()
for _ in 0..<n {
    let input: Int = Int(readLine()!)!
    if input != 0 {
        stack.push(input)
    } else {
        _ = stack.pop()
    }
}
print(stack.sum())
