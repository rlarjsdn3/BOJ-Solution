import Foundation

// 정수 A, B, C 입력 받기
let a = Int(readLine()!)!
let b = Int(readLine()!)!
let c = Int(readLine()!)!
// 숫자가 쓰인 횟수 저장
var result = [Int](repeating: 0, count: 10)

// 모두 곱한 결과 문자열을 순회하며 횟수 저장하기
var number = String(a * b * c)
for n in number {
    let pos = Int(n.asciiValue!) - 48
    result[pos] += 1
}
// 결과 답안 출력
result.forEach { print($0) }

