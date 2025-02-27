import Foundation

// N 입력 받기
let n = Int(readLine()!)!
var result = 0 // 합
for i in 1...n {
    result += i
}
print(result) // 결과 답안 출력
