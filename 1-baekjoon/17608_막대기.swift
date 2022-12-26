import Foundation

// 스택을 구현한 구조체
public struct Stack<T> {
    fileprivate var array: [T] = []
    
    public var isEmpty: Bool {
        return array.isEmpty
    }
    
    public var count: Int {
        return array.count
    }

    public mutating func push(_ element: T) {
        array.append(element)
    }

    @discardableResult public mutating func pop() -> T? {
        return array.popLast()
    }

    public var top: T? {
        return array.last
    }
}

extension Stack where T: Equatable {
    public func contains(_ element: T) -> Bool {
        return array.contains(element)
    }
}

let n: Int = Int(readLine()!)! // 막대기의 개수 입력 받기
var bar: [Int] = []
for _ in 0..<n {
    bar.append(Int(readLine()!)!) // 각 막대기의 길이 입력 받기
}

var stack: Stack<Int> = Stack<Int>() // 스택 선언
var visited: [Bool] = [Bool](repeating: false, count: 100_001) // 값이 이미 존재하는지 확인하는 배열 변수

// 막대기를 차례대로 순회
for element in bar {
    // 스택 상단에 값이 존재하는 경우
    while !stack.isEmpty {
        let top: Int = stack.top!
        // 스택 상단의 값이 푸쉬(push)할 값보다 더 작은 경우
        if top < element {
            visited[stack.pop()!] = false // 스택 상단 값 제거하고 미방문 표시
        } else {
            break // 루프 탈출
        }
    }
    
    // 스택에 동일한 값이 없는 경우
    if !visited[element] {
        stack.push(element) // 푸쉬하기
        visited[element] = true // 방문 표시하기
    }
}
print(stack.count) // 결과값 출력
