import Foundation

struct Stack<T> {
    var array = [T]()
    
    var size: Int {
        array.count
    }
    
    var isEmpty: Bool {
        array.isEmpty
    }
    
    mutating func push(_ element: T) {
        array.append(element)
    }
    
    @discardableResult mutating func pop() -> T? {
        guard !isEmpty else { return nil }
        return array.removeLast()
    }
    
    var top: T? {
        array.last
    }
}

// 명령어의 개수 N 입력 받기
let n = Int(readLine()!)!

var stack = Stack<Int>()

// N개만큼 명령어 입력 받기
for _ in 0..<n {
    let input = readLine()!
    // 명령어에 'push' 단어가 포함되어 있다면
    if input.contains("push") {
        let e = Int(input.split(separator: " ")[1])!
        stack.push(e)
        continue
    }
    
    // 명령어가 기타 단어가 포함되어 있다면
    switch input {
    case "top":
        print(stack.top ?? -1)
    case "size":
        print(stack.size)
    case "pop":
        print(stack.pop() ?? -1)
    default: // "empty"
        print(stack.isEmpty ? 1 : 0)
    }
}
