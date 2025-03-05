import Foundation

// 문어의 수 N 입력 받기
let n = Int(readLine()!)!

var s = 1
// 수열 계산하기
for i in 1...n {
    // 마지막 수열이라면
    if i == n {
        s += 1
    } else {
        // 짝수 번째 수열이라면
        if i % 2 == 0 {
            s += 1
        // 홀수 번째 수열이라면
        } else {
            s = 1
        }
    }
    print(s) // 결과 답안 출력
}


