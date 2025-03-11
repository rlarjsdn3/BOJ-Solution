import Foundation

// 고유번호 5자리 입력 받기
let array = readLine()!.split(separator: " ").map { Int($0)! }
// 결과 답안 출력
let sum = array.reduce(0.0, { $0 + pow(Double($1), 2) })
print(Int(sum) % 10)
