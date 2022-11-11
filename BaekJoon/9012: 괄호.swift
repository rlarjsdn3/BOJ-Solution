//
//  Created by 김건우 on 2022/11/11.
//

import Foundation

struct Stack<T> {
    var items: [T] = []
    var isEmpty: Bool {
        items.isEmpty
    }
    
    mutating func push(_ element: T) {
        items.append(element)
    }
    
    mutating func pop() -> T? {
        if items.isEmpty {
            return nil
        }
        
        return items.removeLast()
    }
}

func checkBracket(_ bracket: [Character]) -> Bool {
    var stack: Stack<Character> = Stack<Character>()
    
    for b in bracket {
        switch b {
        case "(":
            stack.push(b)
        default:
            guard let _ = stack.pop() else {
                return false
            }
        }
    }
    
    if stack.isEmpty {
        return true
    } else {
        return false
    }
}

let n: Int = Int(readLine()!)!
var bracket: [[Character]] = []
for _ in 0..<n {
    bracket.append(Array(readLine()!))
}

for i in bracket.indices {
    print(checkBracket(bracket[i]) ? "YES" : "NO")
}
