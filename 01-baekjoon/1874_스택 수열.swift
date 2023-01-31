import Foundation

struct Stack<Element> {
    // 요소를 저장할 배열
    private var items: [Element] = []
    
    // 배열에 삽입된 요소의 개수를 반환
    public var count: Int {
        return items.count
    }
    
    // 배열이 비어있으면 true, 비어있지 않다면 false를 반환
    public var isEmpty: Bool {
        return items.isEmpty
    }
    
    // 시간 복잡도: O(1)
    // 배열의 맨 뒤에 요소 삽입
    public mutating func push(_ element: Element) {
        items.append(element)
    }
    
    // 시간 복잡도: O(1)
    // 배열의 맨 뒤의 요소 삭제
    @discardableResult
    public mutating func pop() -> Element? {
        guard !isEmpty else {
            return nil
        }
        
        return items.removeLast()
    }
    
    // 시간 복잡도: O(1)
    // 배열의 맨 뒤의 요소 반환
    public func peek() -> Element? {
        guard !isEmpty else {
            return nil
        }
        
        return items.last
    }
}

extension Stack: CustomStringConvertible {
    public var description: String {
        return items.description
    }
}

let n: Int = Int(readLine()!)!
var array: [Int] = []
for _ in 0..<n {
    array.append(Int(readLine()!)!)
}

var k: Int = 0
var stack: Stack<Int> = Stack<Int>()
var result: [Character] = []
for i in 1...n {
    // 스택에 요소 하나 삽입
    stack.push(i)
    result.append("+")
    
    // 스택 상단에 요소가 존재하면 peek() 하기
    while let p = stack.peek() {
        // 스택 상단과 수열 요소가 서로 같으면
        if p == array[k] {
            // pop() 하기
            k += 1
            stack.pop()
            result.append("-")
        } else {
            break
        }
    }
}

if stack.isEmpty {
    result.forEach {
        print($0)
    }
} else {
    print("NO")
}
