import Foundation

// 사탕 묶음의 개수 N 입력 받기
let n = Int(readLine()!)!
// 각 사탕 묶음에 담겨있는 사탕의 개수 입력 받기
let array = readLine()!.split(separator: " ")
    .map { Int($0)! }.sorted()

// 각 묶음 속 모든 사탕 개수 더하기
var total = array.reduce(0, +)

if total % 2 != 0 {
    // 전체 사탕 개수에서 가장 작은 홀수 개의 사탕 빼기
    if let count = array.first(where: { $0 % 2 == 1 }) {
        total -= count
    } else {
        total = 0
    }
}

// 결과 답안 출력
print(total)
