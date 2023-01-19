import Foundation

// 정수 A 입력 받기
let a: String = readLine()!
// 연산자 입력 받기
let o: String = readLine()!
// 정수 B 입력 받기
var b: String = readLine()!

// 정수 A와 B 중 큰 값 구하기
var maxValue: String = a > b ? a : b
var minValue: String = a < b ? a : b

// 연산 결과 구하고, 결과값 저장하기
var result: String = "1"
switch o {
case "+":
    if minValue == maxValue {
        result = "2"
    }
    
    for i in stride(from: maxValue.count-1, to: 0, by: -1) {
        if i == minValue.count {
            result.append("1")
        } else {
            result.append("0")
        }
    }
case "*":
    for _ in 0..<(minValue.count+maxValue.count-2) {
        result.append("0")
    }
default:
    result = ""
}
print(result) // 결과값 출력하기
