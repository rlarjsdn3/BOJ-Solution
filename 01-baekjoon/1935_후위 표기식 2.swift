import Foundation

// String 구조체 확장
extension String {
    public var isOperator: Bool {
        return self == "+" || self == "-" || self == "*" || self == "/"
    }
}

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

// 피연산자의 개수 N 입력 받기
let n = Int(readLine()!)!
// 후위표기식 입력 받기
var postfixNotation = Array(readLine()!).map { String($0) }
// 각 영문자에 대응하는 값 입력 받기
var number: [String: String] = [:]
for i in 0..<n {
    number[String(UnicodeScalar(65 + i)!)] = readLine()!
}
// 후위표기식의 각 영문자를 모두 수로 치환
postfixNotation = postfixNotation.map {
    if $0.isOperator {
        return $0
    } else {
        return number[$0]!
    }
}

// 스택 구조체 선언
var stack = Stack<Double>()

// 후위표기식 연산 수행하기
for p in postfixNotation {
    switch p {
    // 덧셈(+) 연산인 경우
    case "+":
        var opr1 = stack.pop()!
        var opr2 = stack.pop()!
        stack.push(opr2 + opr1)
    // 덧셈(+) 연산인 경우
    case "-":
        var opr1 = stack.pop()!
        var opr2 = stack.pop()!
        stack.push(opr2 - opr1)
    // 덧셈(+) 연산인 경우
    case "*":
        var opr1 = stack.pop()!
        var opr2 = stack.pop()!
        stack.push(opr2 * opr1)
    // 덧셈(+) 연산인 경우
    case "/":
        var opr1 = stack.pop()!
        var opr2 = stack.pop()!
        stack.push(opr2 / opr1)
    // 숫자인 경우
    default:
        stack.push(Double(p)!)
    }
    
    // 주의! - 먼저 pop 되는 숫자가 두 번째 값, 나중에 pop되는 숫자가 첫 번째 값으로 하여 계산해야 한다.
}
print(String(format: "%.2lf", stack.pop()!)) // 결과값 출력하기
