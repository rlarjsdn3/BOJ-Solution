import Foundation

// 정수 N 입력 받기
let n = Int(readLine()!)!

// 결과 답안 출력
for i in 1...n {
    // 공백 더하기
    var stars = String(repeating: " ", count: n - i)
    // 별 찍기
    stars += String(repeating: "*", count: i)
    print(stars)
}
