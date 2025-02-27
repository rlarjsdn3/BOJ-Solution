import Foundation

// A, B 입력 받기
let input = readLine()!.split(separator: " ").map { Int($0)! }
let (a, b) = (input[0], input[1])
// C 입력 받기
let c = Int(readLine()!)!

var adjustedHour = a
var adjustedMinutes = b + c
if adjustedMinutes >= 60 {
    adjustedHour += adjustedMinutes / 60
    adjustedMinutes %= 60
}
if adjustedHour >= 24 {
    adjustedHour -= 24
}

print(adjustedHour, adjustedMinutes) // 결과 답안 출력
