import Foundation

// 스택(Stack) 자료구조
struct Stack<T> {
    var items: [T] = []
    
    var isEmpty: Bool {
        items.isEmpty
    }
    
    mutating func push(_ element: T) {
        items.append(element)
    }
    
    @discardableResult
    mutating func pop() -> T? {
        guard !isEmpty else {
            return nil
        }
        
        return items.removeLast()
    }
    
    var top: T? {
        guard !isEmpty else {
            return nil
        }
        
        return items.last
    }
}

// 수열의 크기 N 입력 받기
let n = Int(readLine()!)!
// 수열의 원소 입력 받기
let array = readLine()!.split(separator: " ").map { Int(String($0))! }
// 결과값을 저장하는 변수
var result = [Int](repeating: -1, count: n)
// 스택 구조체 초기화
var stack = Stack<Int>()

for i in 0..<n {
    // 스택이 비어있지 않고, 현재 수열이 스택 top이 가리키는 수열의 값보다 클 때까지
    while !stack.isEmpty && array[stack.top!] < array[i] {
        result[stack.pop()!] = array[i] // 정답 배열에 현재 수열 저장하기
    }
    stack.push(i)
}
// 결과값 출력하기
print(result.map { String($0) }.joined(separator: " "))
