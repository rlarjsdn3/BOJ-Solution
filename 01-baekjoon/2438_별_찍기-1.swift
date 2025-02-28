import Foundation

// 정수 N 입력 받기
let n = Int(readLine()!)!

// 결과 답안 출력
for i in 1...n {
    print(String(repeating: "*", count: i))
}
