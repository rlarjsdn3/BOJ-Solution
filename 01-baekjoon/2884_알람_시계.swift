import Foundation

// H, M 입력 받기
let input = readLine()!.split(separator: " ").map { Int($0)! }
var (h, m) = (input[0], input[1])

var adjustedHour = h // 조정된 시(時)
var adjustedMinutes = m - 45 // 조정된 분(分)

// 조정된 분이 음수라면
if adjustedMinutes < 0 {
    adjustedHour -= 1
    adjustedMinutes += 60
}
// 조정된 시가 음수라면
if adjustedHour < 0 {
    adjustedHour = 23
}

print(adjustedHour, adjustedMinutes) // 답안 결과 출력
