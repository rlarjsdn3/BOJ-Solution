//
//  Created by 김건우 on 2022/11/12.
//

import Foundation

struct Stack<T> {
    private var items: [T] = []
    var isEmpty: Bool {
        items.isEmpty
    }
    
    mutating func push(_ element: T) {
        items.append(element)
    }
    
    mutating func pop() -> T? {
        if isEmpty {
            return nil
        }
        
        return items.removeLast()
    }
}

var string: [[Character]] = []
while true {
    let input: [Character] = Array(readLine()!)
    if input[0] == "." {
        break
    }
    
    string.append(input)
}

for i in string.indices {
    var check: Bool = true
    var stack: Stack<Character> = Stack<Character>()
    
    for b in string[i] {
        switch b {
        case "(", "[":
            stack.push(b)
        case ")", "]":
            if let t = stack.pop() {
                if (b == ")" && t != "(")
                    || (b == "]" && t != "[") {
                    check = false
                    break
                }
            } else {
                check = false
                break
            }
        default:
            continue
        }
    }
    
    if stack.isEmpty && check {
        print("yes")
    } else {
        print("no")
    }
}
