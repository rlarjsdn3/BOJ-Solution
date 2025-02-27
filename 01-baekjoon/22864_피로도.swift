import Foundation

// A, B, C, M 입력 받기
let input = readLine()!.split(separator: " ").map { Int($0)! }
let (a, b, c, m) = (input[0], input[1], input[2], input[3])

var result = 0 // 수행한 일의 양
var fatigue = 0 // 피로도

for _ in 0..<24 {
    // 일을 수행할 수 있다면
    if fatigue <= (m - a) {
        result += b
        fatigue += a
    // 일을 수행할 수 없다면
    } else {
        fatigue -= c
        // 피로도가 0 미만으로 내려가면
        if fatigue < 0 { fatigue = 0 }
    }
}

print(result) // 답안 결과 출력
