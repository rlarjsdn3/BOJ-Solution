import Foundation

// 스택(Stack) 자료구조
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

extension Stack: Sequence {
    public func makeIterator() -> AnyIterator<T> {
        var curr: Stack<T> = self
        return AnyIterator {
            curr.pop()
        }
    }
}

let opr: [Character: Int] = ["+": 1, "-": 1, "*": 2, "/": 2]

// 중위표기식 M 입력 받기
let m = Array(readLine()!)

// 스택 구조체 변수
var stack = Stack<Character>()
// 결과값을 저장할 변수
var result: [Character] = []

// 연산자 우선 순위 체크 함수
func checkPriority(_ o1: Character, _ o2: Character) -> Bool {
    return opr[o1]! <= opr[o2]!
}

// 문자를 하나씩 살펴보며
for c in m {
    switch c {
    // 연산자인 경우
    case "+", "-", "*", "/":
        // 스택이 비어있지 않고, 스택 상단의 연산자가 더 우선 순위가 높거나 같으면
        while !stack.isEmpty && stack.top! != "(" && checkPriority(c, stack.top!) {
            result.append(stack.pop()!)
        }
        stack.push(c)
    // 열린 괄호인 경우
    case "(":
        stack.push(c)
    // 닫힌 괄호인 경우
    case ")":
        // 열린 괄호가 나타날 때까지 스택 속 모든 연산자를 결과 변수에 삽입
        while let element = stack.pop() {
            if element == "(" {
                break
            }
            result.append(element)
        }
    // 이외 숫자인 경우
    default:
        // 결과 변수에 삽입
        result.append(c)
    }
}
// 스택에 남아있는 연산자 모두 뺴내기
while !stack.isEmpty {
    result.append(stack.pop()!)
}
// 결과값 출력하기
print(result.map { String($0) }.joined())
