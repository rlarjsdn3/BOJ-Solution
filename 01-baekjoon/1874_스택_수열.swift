import Foundation

struct Stack<T> {
    var array: [T] = []
    
    var isEmpty: Bool {
        array.isEmpty
    }
    
    var count: Int {
        array.count
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

// 수열의 개수 N 입력 받기
let n = Int(readLine()!)!
// N개의 수열 입력 받기
var array: [Int] = []
for _ in 0..<n {
    array.append(Int(readLine()!)!)
}

var stack = Stack<Int>()

var index = 0 // 요소 추적
var result: [String] = [] // 결과 저장
var isSequence: Bool = true // 수열 충족 여부

// 1부터 N 요소를 스택에 삽입하기
for i in 1...n {
    stack.push(i)
    result.append("+")
    
    // 스택의 최상단 값과 수열의 현재 위치값이 같다면
    while stack.top == array[index] {
        stack.pop() // 스택 팝하기
        if index < n-1 { index += 1 } // 인덱스 갱신
        result.append("-")
    }
}

// 스택이 비어있지 않다면
while !stack.isEmpty {
    let popValue = stack.pop()!
    result.append("-")
    // 팝한 값이 수열의 현재 위치값과 같지 않다면
    if popValue != array[index] {
        isSequence = false
        break
    }
    index += 1 // 인덱스 갱신
}

// 수열이 맞다면
if isSequence {
    result.forEach { print($0) }
// 수열이 아니라면
} else {
    print("NO")
}

